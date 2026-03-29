-- DEFINE DATA
-- ← → ↑ ↓ ✩ ×
local Text = {
    kind            = "text",
    blink_active    = false,
    blink_time      = 0,
}
setmetatable(Text, {__index = BaseItem})

local fonts = {}

for i, font in pairs(Config.fonts) do
    fonts[i] = love.graphics.newFont(font.size)
end

-- CONSTRUCTOR
function Text:new(props)
    if props        == nil then props = {} end
    if props.pos    == nil then props.pos = {} end
    if props.align  == nil then props.align = {} end

    local obj = setmetatable({
        typeable    = props.typeable    or false,
        level       = props.level       or "body", -- body, title, subtitle,
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
        color       = props.color       or {1,1,1},
        font        = fonts[props.font  or "default"],
    }, {__index = self})
    obj:setContent(props.content or "")
    return obj
end



-- DEFAULT METHODS
function Text:measure()
    local width     = self.font:getWidth(self.content)
    local height    = self.font:getHeight()

    return width, height
end

function Text:setContent(content)
    self.content            = content
    self.dim.w, self.dim.h  = self:measure()
end

function Text:Update(dt)
    self:BaseUpdates(dt)
    
    self.blink_time     = self.blink_time + dt
    if self.blink_time  < 0.5 then
        return
    end

    self.blink_time     = 0
    self.blink_active   = not self.blink_active
end

function Text:Draw()
    local text = self.content
    
    if self.typeable then
        text = ":: " .. text
        if self.blink_active then
            text = text .. "|"
        end
    end
    
    love.graphics.setFont(self.font)
    love.graphics.setColor(self.color[1],self.color[2],self.color[3])
    love.graphics.print(text, self.pos.x + self.pos.offsetX, self.pos.y + self.pos.offsetY)
end



-- RETURN DATA
return Text
