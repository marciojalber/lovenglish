-- DEFINE DATA
local game      = {
    version     = "0.0.1",
    title       = "LovEnglish",
    author      = "Márcio Jalber",
    createdAt   = "2026-03-26",
}

local fonts     = {
    default     = {size = 12},
    body        = {size = 12},
    subtitle    = {size = 16},
    title       = {size = 24},
}

local window    = {
    dim         = {
        w       = 800,
        h       = 600,
    },
    -- defaultBg   = {},
}

local audio     = {
    volume      = {
        master  = 1.0,
        music   = 0.4,
        env     = 0.5,
        sfx     = 1.0,
        ui      = 1.0,
    },
    
    sources     = {
        music   = {
            begining    = {"stream", "music/begining.mp3"},
        },
        sfx     = {
            hover1      = {"static", "sounds/select_change.mp3"},
        },
    },
}



-- RETURN DATA
return {
    game    = game,
    fonts   = fonts,
    window  = window,
    audio   = audio,
}
