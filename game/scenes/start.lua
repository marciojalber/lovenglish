-- DEPENDENCIES
Window = require("jflua.jfres.window")

-- DEFINE DATA
local scene = {}



-- LOAD SCENE
function scene:load()
    win_w   = love.graphics.getWidth()
    win_h   = love.graphics.getHeight()
    
    x_half  = win_w/2
    y_half  = win_h/2
    
    card_w  = 300
    card_h  = 100
    
    Card1   = Card:new({
        x = Window.centerX(card_w),
        y = Window.centerY(card_h),
        w = card_w,
        h = card_h}
    )
    Card2   = Card:new({w = 50, h = 20})

    Text1   = Text:new({content = "CHOOSE YOUR GAME", x = x_half - card_w / 2 + 10, y = y_half - card_h / 2 + 10})
    Text2   = Text:new({content = "Command line:", x = 10, y = win_h - 50})
    Text3   = Text:new({content = "", x = 10, y = win_h - 30, typeable = true})
    World:register(Card1, Card2, Text1, Text2, Text3)
end



-- RETURN DATA
return scene
