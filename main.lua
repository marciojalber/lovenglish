utf8 = require("utf8")
Card = require("jfitem/card")
Text = require("jfitem/text")

shapes      = {}
texts       = {}
collections = {shapes, texts}

function register(...)
    for _, item in pairs({...}) do
        if item.kind == "card" then
            table.insert(shapes, item)
        elseif item.kind == "text" then
            table.insert(texts, item)
        end
    end
end

function love.load()
    settup()
    
    win_w   = love.graphics.getWidth()
    win_h   = love.graphics.getHeight()
    
    x_half  = win_w/2
    y_half  = win_h/2
    
    card_w  = 300
    card_h  = 100
    
    Card1   = Card:new({w = card_w, h = card_h})
    Text1   = Text:new({content = "CHOOSE YOUR GAME", x = x_half - card_w / 2 + 10, y = y_half - card_h / 2 + 10})
    Text2   = Text:new({content = "Command line:", x = 10, y = win_h - 50})
    Text3   = Text:new({content = "", x = 10, y = win_h - 30, digitable = true})
    register(Card1, Text1, Text2, Text3)
end

function settup()
    love.window.setTitle("Teste")
    love.keyboard.setKeyRepeat(true)
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

function love.update(dt)
    for _, items in pairs(collections) do
        for _, item in pairs(items) do
            item:Update(dt)
        end
    end
end

function love.draw()
    -- love.graphics.setBackgroundColor(0.1, 0.2, 0.3)
    for _, items in pairs(collections) do
        for _, item in pairs(items) do
            item:Draw()
        end
    end
end
