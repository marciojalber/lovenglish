-- DEPENDENCIES
utf8    = require("utf8")



-- DATA
local World = {
    -- Itens
    items           = {},
    itemsCateg      = {
        toDraw      = {},
        texts       = {},
    },
    lastID          = 0,
    orderIsDirty    = false,

    catchHover      = nil,
    hoveringID      = nil,

    -- Scene layers
    LBack0  = 1,
    LBack1  = 2,
    LBack2  = 3,
    LWorld  = 4,
    
    -- Active scenes
    scenes  = {},
    ui      = {},
}
local drawable  = {
    btn         = true,
    card        = true,
    text        = true,
}


-- METHODS
function World:nextID()
    self.lastID = self.lastID + 1
    return self.lastID
end

function World:loadScenes()
    self.scenes.start = require("game.scenes.start")
    self.scenes.ui    = require("game.scenes.ui")
end

function World:add(...)
    for i = 1, select("#", ...) do
        local item = select(i, ...)
        if self.items[item.id] == nil then
            if drawable[item.kind] then
                self.orderIsDirty                  = true
                local last                         = #self.itemsCateg.toDraw + 1
                item.drawOrder                     = last
                self.itemsCateg.toDraw[last]       = item
            end

            if item.kind == "text" then
                self.itemsCateg.texts[item.id]     = true
            end
            
            self.items[item.id] = item
        end
    end
end

function World:remove(id)
    if self.itemsCateg.texts[id] then
        self.itemsCateg.texts[id]  = nil
    end
    
    local item = self.items[id]
    if not item then
        return
    end
    
    local idx       = item.drawOrder

    if idx then
        local last  = #self.itemsCateg.toDraw

        if idx ~= last then
            self.itemsCateg.toDraw[idx]             = self.itemsCateg.toDraw[last]
            self.itemsCateg.toDraw[idx].drawOrder   = idx
        end

        self.orderIsDirty                       = true
        self.itemsCateg.toDraw[last]            = nil
    end

    self.items[id] = nil
end

function love.textinput(t)
    for id in pairs(World.itemsCateg.texts) do
        local item = World.items[id]
        if item.typeable then
            item.content = item.content .. t
        end
    end
end

function love.keypressed(key)
    if key ~= "backspace" then
        return
    end

    -- remove last character (UTF-8 safe)
    for id in pairs(World.itemsCateg.texts) do
        local item = World.items[id]
        if item.typeable then
            local byteoffset = utf8.offset(item.content, -1)
            if byteoffset then
                item.content = string.sub(item.content, 1, byteoffset - 1)
            end
        end
    end
end

function love.update(dt)
    World:update(dt)
end

function World:update(dt)
    updateLogic(self, dt)
    updateDrawOrder(self, dt)
    resolveHover(self, dt)
end

function updateLogic(self, dt)
    for _, item in pairs(self.items) do
        if item.Update then
            item:Update(dt)
        end
    end
end

function updateDrawOrder(self, dt)
    if self.orderIsDirty then
        table.sort(self.itemsCateg.toDraw, function(a, b)
            if a.zIndex ~= b.zIndex then
                return a.zIndex < b.zIndex
            end
            return a.id < b.id
        end)
    
        -- only if you use index optimization
        for i = 1, #self.itemsCateg.toDraw do
            self.itemsCateg.toDraw[i].drawOrder = i
        end
    
        self.orderIsDirty = false
    end
end

function resolveHover(self, dt)
    -- @todo Test, validate and apply
    --[[
        -- FIRST VERSION
        for i = #self.itemsCateg.toDraw, 1, -1 do
            local item = self.itemsCateg.toDraw[i]

            if item:CheckHover() then
                if self.hoveringID ~= item.id then
                    -- blur old
                    local old = self.items[self.hoveringID]
                    if old and old.onBlur then
                        old:onBlur(dt)
                    end

                    -- focus new
                    self.hoveringID = item.id
                    if item.onFocus then
                        item:onFocus(dt)
                    end
                end

                self.catchHover = false
                break
            end
        end    


        -- SECOND VERSION
        local newHoverID = nil

        -- top-most first
        for i = #self.itemsCateg.toDraw, 1, -1 do
            local item = self.itemsCateg.toDraw[i]

            if item.CheckHover and item:CheckHover() then
                newHoverID = item.id
                break
            end
        end

        -- no change → do nothing
        if newHoverID == self.hoveringID then
            return
        end

        -- blur old
        if self.hoveringID then
            local old = self.items[self.hoveringID]
            if old and old.onBlur then
                old:onBlur(dt)
            end
        end

        -- focus new
        self.hoveringID = newHoverID

        if newHoverID then
            local item = self.items[newHoverID]
            if item and item.onFocus then
                item:onFocus(dt)
            end
        end
    ]]
    self.catchHover = true
    if self.catchHover == true then
        if self.hoveringID then
            local old_id    = self.hoveringID
            local item      = self.items[old_id]
            self.hoveringID = nil

            if item and item.onBlur then
                item:onBlur(dt)
            end
        end
    end
end

function love.draw()
    -- love.graphics.setBackgroundColor(0.1, 0.2, 0.3)
    local drawList = World.itemsCateg.toDraw
    for i = 1, #drawList do
        drawList[i]:Draw()
    end
end



-- RETURN DATA
return World

--[[
    -- entity.priority = 500 -> Player + clickables in the front

    if world.dirtySort then
        table.sort(...)
        world.dirtySort = false
    end

    table.sort(world.drawList, function(a, b)
        if a.z ~= b.z then
            return a.z < b.z
        end
        if a.priority ~= b.priority then
            return a.priority < b.priority
        end
        return a.id < b.id
    end)
]]