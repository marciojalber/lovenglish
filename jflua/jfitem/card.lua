-- DEFINE DATA
local Card = {
    kind    = "card",
}
setmetatable(Card, {__index = BaseItem})



-- CONSTRUCTOR
function Card:new(props)
    if props        == nil then props = {} end
    if props.pos    == nil then props.pos = {} end
    if props.align  == nil then props.align = {} end
    if props.dim    == nil then props.dim = {} end
    
    return setmetatable({
        id          = World:nextID(),
        pos         = {
            x       = props.pos.x       or 0,
            y       = props.pos.y       or 0,
            offsetX = props.pos.offsetX or 0,
            offsetY = props.pos.offsetY or 0,
        },
        align       = props.align,
        dim         = {
            w       = props.dim.w       or 0,
            h       = props.dim.h       or 0,
        },
        color       = props.color       or {0.8, 0.8, 0.8},
        scaleX      = props.scaleX      or 1,
        scaleY      = props.scaleY      or 1,
    }, {__index = self})
end



-- DEFAULT METHODS
function Card:Update(dt)
    self:BaseUpdates(dt)
end

function Card:Draw()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3], 0.2)
    love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.dim.w, self.dim.h)
end



-- RETURN DATA
return Card
