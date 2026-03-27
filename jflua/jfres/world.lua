-- DEPENDENCIES
utf8    = require("utf8")



-- DATA
local World = {
    -- Itens
    items       = {}
    itemsCateg  = {
        shapes  = {},
        texts   = {},
    },
    itemsCount  = {
        shapes  = 0,
        texts   = 0,
    },
    lastID      = 0,

    catchHover  = nil,
    hoveringID  = nil,

    -- Scene layers
    LBack0  = 2,
    LBack1  = 3,
    LBack2  = 4,
    LWorld  = 5,
    
    -- 
    scenes  = {},
    ui      = {},
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
    World.items[item.id] = item

    for _, item in pairs({...}) do
        if data.contains(item.kind, {"btn", "card"}) and World.items.shapes[item.id] == nil then
            World.itemsCateg.shapes[item.id]    = item
            World.itemsCount.shapes             = World.itemsCount.shapes + 1
        elseif item.kind == "text" and World.items.texts[item.id] == nil then
            World.itemsCateg.texts[item.id]     = item
            World.itemsCount.texts              = World.itemsCount.texts + 1
        end
    end
end

function World:remove(id)
    local last          = #self.items
    self.items[id]      = self.items[last]
    self.items[last]    = nil
end

function love.update(dt)
    World.catchHover = true
    
    for _, items in pairs(World.items) do
        for _, item in pairs(items) do
            item:Update(dt)
        end
    end
    
    if World.catchHover == true then
        if World.hoveringID then
            local old_id = World.hoveringID
            World.hoveringID = nil

            for _, items in pairs(World.items) do
                if items[old_id] and items[old_id].onBlur then
                    items[old_id]:onBlur(dt)
                end
            end
        end
    end
end

function love.draw()
    -- love.graphics.setBackgroundColor(0.1, 0.2, 0.3)
    for _, items in pairs(World.items) do
        for _, item in pairs(items) do
            item:Draw()
        end
    end

    local m_x, m_y = love.mouse.getPosition()
end

function love.textinput(t)
    for _, item in pairs(World.items.texts) do
        if item.typeable then
            item.content = item.content .. t
        end
    end
end

function love.keypressed(key)
    if key == "backspace" then
        -- remove last character (UTF-8 safe)
        for _, item in pairs(World.items.texts) do
            if item.typeable then
                local byteoffset = utf8.offset(item.content, -1)
                if byteoffset then
                    item.content = string.sub(item.content, 1, byteoffset - 1)
                end
            end
        end
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