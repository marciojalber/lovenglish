-- DEFINE DATA
local Card = {
    kind    = "card",

    x       = 0,
    y       = 0,
    w       = 150,
    h       = 100,
}



-- CONSTRUCTOR
function Card:new(props)
    return setmetatable({
        x = props.x or self.x,
        y = props.y or self.y,
        w = props.w or self.w,
        h = props.h or self.h,
    }, {__index = self})
end



-- DEFAULT METHODS
function Card:Update(dt)
end

function Card:Draw()
    -- love.graphics.setColor(1, 0, 1)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end



-- RETURN DATA
return Card
