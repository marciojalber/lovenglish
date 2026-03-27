-- DEFINE DATA
local scene = {}



-- LOAD SCENE
function scene:load()
    local Text1 = Text:new({
        content = "Window status",
        alignX  = "right",
        alignY  = "bottom",
        offsetX = -10,
        offsetY = -10,
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
        alignX  = "right",
        alignY  = "bottom",
        offsetX = -10,
        offsetY = -30,
        color   = {0.4, 0.4, 0.4},
    })

    function Text2:Update()
        local content = "Shapes (" .. World.itemsCount.shapes .. "):"
        for idx in pairs(World.items.shapes) do
            content = content .. " " .. idx
        end
        
        self:setContent(content)
        self:BaseUpdates(dt)
    end

    local Text3 = Text:new({
        content = "texts",
        alignX  = "right",
        alignY  = "bottom",
        offsetX = -10,
        offsetY = -50,
        color   = {0.4, 0.4, 0.4},
    })

    function Text3:Update()
        local content = "Texts (" .. World.itemsCount.texts .. "):"
        for idx in pairs(World.items.texts) do
            content = content .. " " .. idx
        end
        
        self:setContent(content)
        self:BaseUpdates(dt)
    end

    World:add(Text1, Text2, Text3)
end



-- RETURN DATA
return scene
