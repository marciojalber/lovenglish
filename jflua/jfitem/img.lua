-- DEFINE DATA
local Img = {
    kind    = "img",
}
setmetatable(Img, {__index = BaseItem})

-- CONSTRUCTOR
function Img:new(source, props)
    if props        == nil then props = {} end
    if props.pos    == nil then props.pos = {} end
    if props.align  == nil then props.align = {} end

    return setmetatable({
        source      = source,
        pos         = {
            x       = props.pos.x       or 0,
            y       = props.pos.y       or 0,
            offsetX = props.pos.offsetX or 0,
            offsetY = props.pos.offsetY or 0,
        },
        align       = props.align,
        dim         = {
            w       = 0,
            h       = 0,
        },
    }, {__index = self})
end

function Img:Update(dt)
    self:BaseUpdates(dt)
end

function Img:Draw()
    local x, y = self.pos.x + self.pos.offsetX, self.pos.y + self.pos.offsetY
    love.graphics.draw(self.source, x, y)
end



-- RETURN DATA
return Img
