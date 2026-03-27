-- DEFINE DATA
local scene = {}



-- LOAD SCENE
function scene:load()
    local Text = Text:new({
        content = "Teste 2",
        alignX  = "right",
        alignY  = "bottom",
        offsetX = -10,
        offsetY = -10,
        color   = {0.4, 0.4, 0.4},
    })

    function Text:Update()
        local mx, my = love.mouse.getPosition()
        self:setContent("X: " .. mx .. " Y: " .. my)
        self:BaseUpdates(dt)
    end

    World:register(Text)
end



-- RETURN DATA
return scene
