-- DATA
local image = {
}

function image:load(group, name)
    local path = "assets/img/" .. Config.img[group][name]
    return love.graphics.newImage(path)
end

-- RETURN DATA
return image
