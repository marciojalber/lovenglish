-- DEFINE DATA
local BaseItem  = {}


-- CONSTRUCTOR
function BaseItem:new()
    return setmetatable({
    }, {__index = self})
end



-- METHODS
function BaseItem:BaseUpdates(dt)
    if self.align.ref and self.align.ref.dim then

        if self.align.x == "center" then
            self.pos.x   = (self.align.ref.dim.w - self.dim.w) / 2
        elseif self.align.x == "right" then
            self.pos.x   = self.align.ref.dim.w - self.dim.w
        end
        
        if self.align.y == "center" then
            self.pos.y   = (self.align.ref.dim.h - self.dim.h) / 2
        elseif self.align.y == "bottom" then
            self.pos.y   = self.align.ref.dim.h - self.dim.h
        end

    end
end

function BaseItem:getXYWH(dt)
    local scaleX, scaleY = 0, 0
    if self.scaleX > 0 and self.scaleX ~= 1 then
        scaleX = self.dim.w * self.scaleX - self.dim.w
    end
    if self.scaleY > 0 and self.scaleY ~= 1 then
        scaleY = self.dim.h * self.scaleY - self.dim.h
    end
    
    local x = self.pos.x + self.pos.offsetX - scaleX/2
    local y = self.pos.y + self.pos.offsetY - scaleY/2
    local w = self.dim.w + scaleX
    local h = self.dim.h + scaleY

    return x, y, w, h
end



-- RETURN DATA
return BaseItem
