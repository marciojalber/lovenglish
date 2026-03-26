-- DEFINE DATA
local Btn = {
    kind    = "btn",

    x       = 0,
    y       = 0,
    w       = 100,
    h       = 30,
    color   = {0.8, 0.8, 0.8},
}



-- CONSTRUCTOR
function Btn:new(props)
    if not props then props = {} end
    return setmetatable({
        x = props.x or self.x,
        y = props.y or self.y,
        w = props.w or self.w,
        h = props.h or self.h,
    }, {__index = self})
end



-- DEFAULT METHODS
function Btn:Update(dt)
end

function Btn:Draw()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3])
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end



-- RETURN DATA
return Btn
