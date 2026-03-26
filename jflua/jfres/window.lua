-- DATA
local Window = {}


-- METHODS
function Window:centerX(w)
    return (love.graphics.getWidth() - w) / 2
end

function Window:centerY(h)
    return (love.graphics.getHeight() - h) / 2
end



-- RETURN DATA
return Window
