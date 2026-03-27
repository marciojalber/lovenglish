-- DEFINE DATA
local Card = {
    kind    = "card",
}
setmetatable(Card, {__index = BaseItem})



-- CONSTRUCTOR
function Card:new(props)
    if not props then props = {} end
    return setmetatable({
        id      = World:nextID(),
        alignX  = props.alignX  or self.alignX,
        alignY  = props.alignY  or self.alignY,
        x       = props.x       or 0,
        y       = props.y       or 0,
        offsetX = props.offsetX or 0,
        offsetY = props.offsetY or 0,
        w       = props.w       or 0,
        h       = props.h       or 0,
    }, {__index = self})
end



-- DEFAULT METHODS
function Card:Update(dt)
    self:BaseUpdates(dt)
end

function Card:Draw()
    -- love.graphics.setColor(1, 0, 1)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end



-- RETURN DATA
return Card
