-- DEFINE DATA
local Card = {
    kind    = "card",

    w       = 150,
    h       = 100,
}



-- CONSTRUCTOR
function Card:new(opts)
    return setmetatable({
        w = opts.w or self.w,
        h = opts.h or self.h,
    }, {__index = self})
end



-- DEFAULT METHODS
function Card:Update(dt)
end

function Card:Draw()
    -- love.graphics.setColor(1, 0, 1)
    local x = (love.graphics.getWidth() - self.w) / 2
    local y = (love.graphics.getHeight() - self.h) / 2
    love.graphics.rectangle("line", x, y, self.w, self.h)
end



-- RETURN DATA
return Card
