-- DEFINE DATA
-- ← → ↑ ↓ ✩ ×
local Text = {
    kind            = "text",
    blink_active    = false,
    blink_time      = 0,
}
setmetatable(Text, {__index = BaseItem})



-- CONSTRUCTOR
function Text:new(props)
    if not props then props = {} end
    local obj = setmetatable({
        content     = props.content  or "",
        typeable    = props.typeable or false,
        level       = props.level    or "body", -- body, title, subtitle,
        alignX      = props.alignX   or nil,
        alignY      = props.alignY   or nil,
        x           = props.x        or 0,
        y           = props.y        or 0,
        offsetX     = props.offsetX  or 0,
        offsetY     = props.offsetY  or 0,
    }, {__index = self})
    obj.w, obj.h = obj:measure()
    return obj
end



-- DEFAULT METHODS
function Text:measure()
    local font      = love.graphics.getFont()
    local width     = font:getWidth(self.content)
    local height    = font:getHeight()

    return width, height
end

function Text:Update(dt)
    self:BaseUpdates(dt)
    self.blink_time = self.blink_time + dt
    if self.blink_time < 0.5 then return end

    self.blink_time = 0
    self.blink_active = not self.blink_active
end

function Text:Draw()
    love.graphics.setColor(1, 1, 1)
    local text = self.content
    if self.typeable then
        text = ":: " .. text
        if self.blink_active then
            text = text .. "|"
        end
    end
    love.graphics.print(text, self.x + self.offsetX, self.y + self.offsetY)
end



-- RETURN DATA
return Text
