local World = {
    -- Itens
    collections = {
        shapes  = {},
        texts   = {},
    },

    -- layers
    LBack0  = 0,
    LBack1  = 1,
    LBack2  = 2,
    LUi     = 3,
    LTop    = 4,
    LWorld  = 5,
    
    scenes  = {},
}

function World:setup()
    love.window.setTitle("Teste")
    love.keyboard.setKeyRepeat(true)
end

function World:loadScenes()
    self.scenes.start = require("game.scenes.start")
end

function World:register(...)
    for _, item in pairs({...}) do
        if item.kind == "card" then
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
end

function love.textinput(t)
    for _, item in pairs(texts) do
        if item.digitable then
            item.content = item.content .. t
        end
    end
end

function love.keypressed(key)
    if key == "backspace" then
        -- remove last character (UTF-8 safe)
        for _, item in pairs(texts) do
            if item.digitable then
                local byteoffset = utf8.offset(item.content, -1)
                if byteoffset then
                    item.content = string.sub(item.content, 1, byteoffset - 1)
                end
            end
        end
    end
end

return World
