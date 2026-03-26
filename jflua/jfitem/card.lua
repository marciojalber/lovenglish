-- PROTO
local Card = {
    kind = "card",
}
Card.__index = Card



-- CONSTRUCTOR
function Card:new(opts)
    local obj = setmetatable({
        w = opts.w or 100,
        h = opts.h or 150,
    }, self)
    return obj
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



-- RETURN
return Card
