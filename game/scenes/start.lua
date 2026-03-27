-- DEPENDENCIES
Window  = require("jflua.jfres.window")

-- DEFINE DATA
local scene = {}



-- LOAD SCENE
function scene:load()
    local Card1 = Card:new({
        alignX  = "center",
        alignY  = "center",
        w       = 300,
        h       = 100,
    })
    local Btn1  = Btn:new({
        x           = 10,
        y           = 10,
        w           = 100,
        h           = 30,
        color       = {0.2, 0.25, 0.3},
    })

    local Btn2  = Btn:new({
        x           = 80,
        y           = 10,
        w           = 100,
        h           = 30,
        color       = {0.2, 0.25, 0.3},
    })

    function Btn1:onHover(event)
        self.color  = {0.1, 0.45, 0.5}
    end

    function Btn1:onBlur()
        self.color  = {0.2, 0.25, 0.3}
    end

    local Text1 = Text:new({
        content = "CHOOSE YOUR GAME",
        alignX  = "center",
        alignY  = "center",
    })
    local Text2 = Text:new({
        content = "Command line:",
        alignY  = "bottom",
        offsetX = 10,
        offsetY = -30,
    })
    local Text3 = Text:new({
        content     = "",
        alignY      = "bottom",
        offsetX     = 10,
        offsetY     = -10,
        typeable    = true,
    })
    World:register(Card1, Btn1, Btn2, Text1, Text2, Text3)
end



-- RETURN DATA
return scene
