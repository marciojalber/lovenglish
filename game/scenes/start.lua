-- DEPENDENCIES
-- DEFINE DATA
local scene = {}



-- LOAD SCENE
function scene:load()
    local Card1 = Card:new({
        align   = {
            ref = Window,
            x   = "center",
            y   = "center",
        },
        dim     = {
            w   = 300,
            h   = 100,
        },
    })
    local Btn1  = Btn:new({
        pos     = {
            x   = 10,
            y   = 10,
        },
        dim     = {
            w   = 100,
            h   = 30,
        },
        color   = {0.2, 0.25, 0.3},
    })

    local Btn2  = Btn:new({
        pos     = {
            x   = 80,
            y   = 50,
        },
        dim     = {
            w   = 100,
            h   = 30,
        },
        color   = {0.2, 0.25, 0.3},
    })

    function Btn1:onHover(event)
        self.color  = {1, 1, 1}
        self.scaleX = 1.1
        self.scaleY = 1.1

        local sound = Sound:fx("hover1")
        sound:play()
    end

    function Btn1:onBlur()
        self.color  = {0.2, 0.25, 0.3}
        self.scaleX = 1
        self.scaleY = 1
    end

    function Btn1:onClick(x, y, button, istouch, presses)
        love.window.close()
    end

    function Btn2:onHover(event)
        self.color  = {1, 1, 1}
        self.scaleX = 1.1
        self.scaleY = 1.1

        local sound = Sound:fx("hover1")
        sound:play()
    end

    function Btn2:onBlur()
        self.color  = {0.2, 0.25, 0.3}
        self.scaleX = 1
        self.scaleY = 1
    end

    local Text1 = Text:new({
        content = "CHOOSE YOUR GAME",
        style   = "title",
        align   = {
            ref = Window,
            x   = "center",
            y   = "center",
        },
        font    = Config.fonts.title,
    })
    local Text2 = Text:new({
        content = "Command line:",
        align   = {
            ref = Window,
            y   = "bottom",
        },
        pos     = {
            offsetX = 10,
            offsetY = -30,
        },
    })
    local Text3 = Text:new({
        content     = "",
        align   = {
            ref = Window,
            y   = "bottom",
        },
        typeable    = true,
        pos         = {
            offsetX     = 10,
            offsetY     = -10,
        },
    })
    World:add(Card1, Btn1, Btn2, Text1, Text2, Text3)
end



-- RETURN DATA
return scene
