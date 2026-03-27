-- DEPENDENCIES
utf8    = require("utf8")



-- DATA
local World = {
    -- Itens
    collections = {
        shapes  = {},
        texts   = {},
    },

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
function World:loadScenes()
    self.scenes.start = require("game.scenes.start")
    self.scenes.ui    = require("game.scenes.ui")
end

function World:register(...)
    for _, item in pairs({...}) do
        if data.contains(item.kind, {"btn", "card"}) then
            table.insert(World.collections.shapes, item)
        elseif item.kind == "text" then
            table.insert(World.collections.texts, item)
        end
    end
end

function love.update(dt)
    for _, items in pairs(World.collections) do
        for _, item in pairs(items) do
            item:Update(dt)
        end
    end
end

function love.draw()
    -- love.graphics.setBackgroundColor(0.1, 0.2, 0.3)
    for _, items in pairs(World.collections) do
        for _, item in pairs(items) do
            item:Draw()
        end
    end

    local m_x, m_y = love.mouse.getPosition()
end

function love.textinput(t)
    for _, item in pairs(World.collections.texts) do
        if item.typeable then
            item.content = item.content .. t
        end
    end
end

function love.keypressed(key)
    if key == "backspace" then
        -- remove last character (UTF-8 safe)
        for _, item in pairs(World.collections.texts) do
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
