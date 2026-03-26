-- DEFINE DATA
-- ← → ↑ ↓ ✩ ×
local Text = {
    kind            = "text",
    blink_active    = false,
    blink_time      = 0,

    content         = "Some text",
    typeable        = false,
    level           = "body", -- body, title, subtitle
    x               = 0,
    y               = 0,
}



-- CONSTRUCTOR
function Text:new(opts)
    local obj = setmetatable({
        content     = opts.content  or self.content,
        typeable    = opts.typeable or self.typeable,
        level       = opts.level    or self.level,
        x           = opts.x        or self.x,
        y           = opts.y        or self.y,
    }, {__index = self})
    return obj
end



-- DEFAULT METHODS
function Text:Update(dt)
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
    love.graphics.print(text, self.x, self.y)
end



-- RETURN DATA
return Text
