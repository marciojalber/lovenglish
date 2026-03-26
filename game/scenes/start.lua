-- DEPENDENCIES
Window  = require("jflua.jfres.window")

-- DEFINE DATA
local scene = {}



-- LOAD SCENE
function scene:load()
    win_w   = love.graphics.getWidth()
    win_h   = love.graphics.getHeight()
    
    x_half  = win_w/2
    y_half  = win_h/2
    
    local card_w  = 300
    local card_h  = 100
    
    Card1   = Card:new({
        x   = Window:centerX(card_w),
        y   = Window:centerY(card_h),
        w   = card_w,
        h   = card_h}
    )
    Btn1    = Btn:new({x = 10, y = 10, w = 100, h = 30})

    Text1   = Text:new({content = "CHOOSE YOUR GAME", x = x_half - card_w / 2 + 10, y = y_half - card_h / 2 + 10})
    Text2   = Text:new({content = "Command line:", x = 10, y = win_h - 50})
    Text3   = Text:new({content = "", x = 10, y = win_h - 30, typeable = true})
    World:register(Card1, Btn1, Text1, Text2, Text3)
end



-- RETURN DATA
return scene
