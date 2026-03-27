-- DEFINE DATA
local BaseItem = {}



-- CONSTRUCTOR
function BaseItem:new()
    return setmetatable({
        alignX = nil,
        alignY = nil,
    }, {__index = self})
end



-- METHODS
function BaseItem:BaseUpdates(dt)
    if self.alignX == "center" then
        self.x   = (love.graphics.getWidth() - self.w) / 2
    elseif self.alignX == "right" then
        self.x   = love.graphics.getWidth() - self.w
    end
    
    if self.alignY == "center" then
        self.y   = (love.graphics.getHeight() - self.h) / 2
    elseif self.alignY == "bottom" then
        self.y   = love.graphics.getHeight() - self.h
    end
end



-- RETURN DATA
return BaseItem
