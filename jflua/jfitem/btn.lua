-- DEFINE DATA
local Btn = {
    kind    = "btn",
}
setmetatable(Btn, {__index = BaseItem})


-- CONSTRUCTOR
function Btn:new(props)
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

        hoverable   = props.alignX      or true,
    }, {__index = self})
end



-- DEFAULT METHODS
function Btn:Update(dt)
    self:BaseUpdates(dt)
end

function Btn:Draw()
    local x, y, w, h = self:getXYWH()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3])
    love.graphics.rectangle("fill", x, y, w, h)
end



-- RETURN DATA
return Btn
