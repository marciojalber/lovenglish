-- DEFINE DATA
local    Window      = require("game.window")
local scene = {}



-- LOAD SCENE
function scene:load()
    local Text1 = Text:new({
        content = "Window status",
        pos     = {
            offsetX = -10,
            offsetY = -10,
        },
        align   = {
            ref = Window,
            x   = "right",
            y   = "bottom",
        },
        color   = {0.4, 0.4, 0.4},
    })

    function Text1:Update()
        local mx, my = love.mouse.getPosition()
        local content = " X: " .. mx .. " Y: " .. my
        if World.hoveringID then
            content = "Hovering: " .. World.hoveringID .. content
        end
        self:setContent(content)
        self:BaseUpdates(dt)
    end

    local Text2 = Text:new({
        content = "Shapes",
        pos     = {
            offsetX = -10,
            offsetY = -30,
        },
        align   = {
            ref = Window,
            x   = "right",
            y   = "bottom",
        },
        color   = {0.4, 0.4, 0.4},
    })

    function Text2:Update()
        local tot_items = 0
        local content = ""
        for idx in pairs(World.itemsCateg.toDraw) do
            content     = content .. " " .. idx
            tot_items  = tot_items + 1
        end
        content = "To draw (" .. tot_items .. "):" .. content
        
        self:setContent(content)
        self:BaseUpdates(dt)
    end

    local Text3 = Text:new({
        content = "texts",
        pos     = {
            offsetX = -10,
            offsetY = -50,
        },
        align   = {
            ref = Window,
            x   = "right",
            y   = "bottom",
        },
        color   = {0.4, 0.4, 0.4},
    })

    function Text3:Update()
        local tot_items = 0
        local content = ""
        for idx in pairs(World.itemsCateg.texts) do
            content = content .. " " .. idx
            tot_items  = tot_items + 1
        end
        content = "Texts (" .. tot_items .. "):" .. content
        
        self:setContent(content)
        self:BaseUpdates(dt)
    end

    World:add(Text1, Text2, Text3)
end



-- RETURN DATA
return scene
