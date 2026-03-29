-- DEFINE DATA
local config = {
    game        = {
        version     = "0.0.1",
        title       = "LovEnglish",
        author      = "Márcio Jalber",
        createdAt   = "2026-03-26",
    },
    fonts       = {
        default     = love.graphics.newFont(12),
        body        = love.graphics.newFont(12),
        subtitle    = love.graphics.newFont(16),
        title       = love.graphics.newFont(24),
    },
    window      = {
        dim         = {
            w       = 800,
            h       = 600,
        },
        -- defaultBg   = {},
    },
    soundCtrl   = {
        volumeMs    = 0.5,
        volumeFx    = 0.5,
    },
    musics      = {
        beginig     = love.audio.newSource("assets/music/begining.mp3", "static"),
    },
    sounds      = {
        hover1      = love.audio.newSource("assets/sounds/select_change.mp3", "static"),
    },
}


-- RETURN DATA
return config