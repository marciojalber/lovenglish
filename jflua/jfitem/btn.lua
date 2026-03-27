-- DEFINE DATA
local Btn = {
    kind    = "btn",
}
setmetatable(Btn, {__index = BaseItem})


-- CONSTRUCTOR
function Btn:new(props)
    if not props then props = {} end
    return setmetatable({
        alignX  = props.alignX  or self.alignX,
        alignY  = props.alignY  or self.alignY,
        x       = props.x       or self.x,
        y       = props.y       or self.y,
        offsetX = props.offsetX or 0,
        offsetY = props.offsetY or 0,
        w       = props.w       or self.w,
        h       = props.h       or self.h,
        color   = props.color   or {0.8, 0.8, 0.8},
    }, {__index = self})
end



-- DEFAULT METHODS
function Btn:Update(dt)
    self:BaseUpdates(dt)
end

function Btn:Draw()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3])
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end



-- RETURN DATA
return Btn
