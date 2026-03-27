-- DATA
local Window = {}


-- METHODS
function Window:setup()
	love.window.setMode(
        Config.window.width,
        Config.window.height,
        {
            resizable   = true,
            vsync       = true,
            minwidth    = 320,
            minheight   = 240,
        }
    )
    love.window.setTitle(Config.game.title)
    love.keyboard.setKeyRepeat(true)
end

function Window:centerX(w)
    return (love.graphics.getWidth() - w) / 2
end

function Window:centerY(h)
    return (love.graphics.getHeight() - h) / 2
end



-- RETURN DATA
return Window
