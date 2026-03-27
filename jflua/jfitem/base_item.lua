-- DEFINE DATA
local BaseItem  = {}


-- CONSTRUCTOR
function BaseItem:new()
    return setmetatable({
        alignX  = nil,
        alignY  = nil,
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

    if World.catchHover and self.hoverable then
        local mx, my    = love.mouse.getPosition()
        local x0, x1    = self.x + self.offsetX, self.x + self.offsetX + self.w
        local y0, y1    = self.y + self.offsetY, self.y + self.offsetY + self.h
        local inside_x  = mx >= x0 and mx <= x1
        local inside_y  = my >= y0 and my <= y1

        if inside_x and inside_y then
            World.catchHover    = false
            local old_id        = World.hoveringID

            if old_id ~= self.id then
                if old_id then
                    for _, items in pairs(World.items) do
                        if items[old_id] and items[old_id].onBlur then
                            items[old_id]:onBlur(dt)
                        end
                    end
                end
                World.hoveringID = self.id
            end

            if self.onHover then
                self:onHover(dt, {mx, my})
            end
        end
    end
end



-- RETURN DATA
return BaseItem
