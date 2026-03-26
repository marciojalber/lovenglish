Vec2 = {}
Vec2.__index = Vec2

-- Constructor
function Vec2:new(x, y)
    return setmetatable({
        x = x or 0,
        y = y or 0
    }, Vec2)
end

-- ========================
-- Metamethods (operators)
-- ========================

-- Addition
function Vec2.__add(a, b)
    if not b then b = {} end
    return Vec2:new(a.x + b.x, a.y + b.y)
end

-- Subtraction
function Vec2.__sub(a, b)
    if not b then b = {} end
    return Vec2:new(a.x - b.x, a.y - b.y)
end

-- Multiplication (vector * scalar OR vector * vector)
function Vec2.__mul(a, b)
    if not b then b = {} end
    if type(a) == "number" then
        return Vec2:new(a * b.x, a * b.y)
    elseif type(b) == "number" then
        return Vec2:new(a.x * b, a.y * b)
    else
        -- element-wise multiply (optional design choice)
        return Vec2:new(a.x * b.x, a.y * b.y)
    end
end

-- Division (vector / scalar OR vector / vector)
function Vec2.__div(a, b)
    if not b then b = {} end
    if type(b) == "number" then
        return Vec2:new(a.x / b, a.y / b)
    else
        return Vec2:new(a.x / b.x, a.y / b.y)
    end
end

-- Unary minus (-v)
function Vec2.__unm(a)
    return Vec2:new(-a.x, -a.y)
end

-- Equality (exact comparison)
function Vec2.__eq(a, b)
    if not b then b = {} end
    return a.x == b.x and a.y == b.y
end

-- String representation
function Vec2.__tostring(v)
    return "(" .. v.x .. ", " .. v.y .. ")"
end

-- ========================
-- Utility methods
-- ========================

function Vec2:length()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vec2:normalize()
    local len = self:length()
    if len == 0 then
        return Vec2:new(0, 0)
    end
    return Vec2:new(self.x / len, self.y / len)
end

function Vec2:dot(v)
    return self.x * v.x + self.y * v.y
end

-- ========================
-- In-place (performance)
-- ========================

function Vec2:add_inplace(v)
    self.x = self.x + v.x
    self.y = self.y + v.y
end

function Vec2:mul_inplace(s)
    self.x = self.x * s
    self.y = self.y * s
end

return Vec2
