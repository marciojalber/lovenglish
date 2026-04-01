-- DEPENDENCIES
-- DEFINE DATA
local scene = {}



-- LOAD SCENE
function scene:load()
    local music         = Audio:load("music", "begining")
    Audio:play(music)
    
    local sfx_houver    = Audio:load("sfx", "hover1")
    local sfx_click     = Audio:load("sfx", "click1")
    local bg            = Image:load("bg", "begining")
    local trees         = Image:load("env", "trees")

    local ImgBg         = Img:new(bg)
    local ImgTest       = Img:new(trees)
    local Card1         = Card:new({
        align           = {
            ref         = Window,
            x           = "center",
            y           = "center",
        },
        dim             = {
            w           = 300,
            h           = 200,
        },
    })

    local Text1         = Text:new({
        content         = "CHOOSE YOUR GAME",
        align           = {
            ref         = Window,
            x           = "center",
            y           = "center",
        },
        pos             = {
            offsetY     = -60,
        },
        style           = "title",
    })

    local Btn1          = Btn:new({
        pos             = {
            offsetY     = 10,
        },
        align           = {
            ref         = Window,
            x           = "center",
            y           = "center",
        },
        dim             = {
            w           = 100,
            h           = 30,
        },
        color           = {0.2, 0.25, 0.3},
    })

    local Btn2          = Btn:new({
        pos             = {
            offsetY     = 60,
        },
        align           = {
            ref         = Window,
            x           = "center",
            y           = "center",
        },
        dim             = {
            w           = 100,
            h           = 30,
        },
        color           = {0.2, 0.25, 0.3},
    })

    function Btn1:onHover(event)
        self.color  = {0.4, 0.5, 0.6}
        self.scaleX = 1.1
        self.scaleY = 1.1

        Audio:play(sfx_houver)
    end

    function Btn1:onBlur()
        self.color  = {0.2, 0.25, 0.3}
        self.scaleX = 1
        self.scaleY = 1
    end

    function Btn2:onHover(event)
        self.color  = {0.4, 0.5, 0.6}
        self.scaleX = 1.1
        self.scaleY = 1.1

        Audio:play(sfx_houver)
    end

    function Btn2:onBlur()
        self.color  = {0.2, 0.25, 0.3}
        self.scaleX = 1
        self.scaleY = 1
    end

    function Btn1:onClick(x, y, button, istouch, presses)
        Audio:play(sfx_click)
    end
    
    function Btn2:onClick(x, y, button, istouch, presses)
        Audio:play(sfx_click)
        love.window.close()
    end
    
    local Text2 = Text:new({
        content = "Start",
        align   = {
            ref = Btn1,
            x   = "center",
            y   = "center",
        },
    })

    local Text3 = Text:new({
        content = "Exit",
        align   = {
            ref = Btn2,
            x   = "center",
            y   = "center",
        },
    })

    World:addItem(ImgBg)
    World:addItem(ImgTest)
    World:addItem(Card1)
    World:addItem(Btn1)
    World:addItem(Btn2)
    World:addItem(Text1)
    World:addItem(Text2)
    World:addItem(Text3)
end



-- RETURN DATA
return scene
