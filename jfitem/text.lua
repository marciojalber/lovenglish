local Text = {
    kind            = "text",
    content         = "Some text",
    blink_active    = false,
    blink_time      = 0,
    digitable       = false,
}
Text.__index = Text

function Text:new(opts)
    local obj = setmetatable({
        content     = opts.content or self.content,
        digitable   = opts.digitable or self.digitable,
        x           = opts.x or self.x,
        y           = opts.y or self.y,
    }, self)
    return obj
end

-- ← → ↑ ↓ ✩ ×

function Text:Update(dt)
    self.blink_time = self.blink_time + dt
    if self.blink_time < 0.5 then return end

    self.blink_time = 0
    self.blink_active = not self.blink_active
end

function Text:Draw()
    love.graphics.setColor(1, 1, 1)
    local text = self.content
    if self.digitable then
        text = ":: " .. text
        if self.blink_active then
            text = text .. "|"
        end
    end
    love.graphics.print(text, self.x, self.y)
end

return Text
