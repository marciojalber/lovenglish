-- DATA
local Window = {
    defaultBg   = {0.4, 0.5, 0.6},
    defaultMode = {
        resizable   = true,
        vsync       = true,
        minwidth    = 320,
        minheight   = 240,
    },
}


if Config.window.defaultBg then
    Window.defaultBg = Config.window.defaultBg
end

-- METHODS
function Window:setup()
    self.dim    = {
        w       = Config.window.dim.w,
        h       = Config.window.dim.h
    },
    -- self:resize(self.dim.w, self.dim.h)
    love.window.setTitle(Config.game.title)
    love.keyboard.setKeyRepeat(true)
end

function Window:centerX(w)
    return (love.graphics.getWidth() - w) / 2
end

function Window:centerY(h)
    return (love.graphics.getHeight() - h) / 2
end

function Window:onResize(w, h)
end

function Window:resize(w, h)
    love.window.setMode(
        w,
        h,
        Window.defaultMode
    )
end

function love.resize(w, h)
    Window.dim  = {
        w       = w,
        h       = h,
    }
end

-- RETURN DATA
return Window
