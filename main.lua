-- DEPENDENCIES

    -- Default
    Config      = require("game.config")
    Window      = require("jflua.jfres.window")
    World       = require("jflua.jfres.world")
    data        = require("jflua.jfdata.data")

    -- Extra
    BaseItem    = require("jflua.jfitem.base_item")
    Card        = require("jflua.jfitem.card")
    Btn         = require("jflua.jfitem.btn")
    Text        = require("jflua.jfitem.text")


-- Music by <a href="https://pixabay.com/users/joyinsound-51634429/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=391742">JoyInSound</a> from <a href="https://pixabay.com/music//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=391742">Pixabay</a>

-- START GAME
function love.load()
    -- sound = love.sound.newSoundData("assets/music/salon.mp3")
    -- sound = love.sound.newSoundData("assets/music/begining.mp3")
    local music1 = love.audio.newSource("assets/music/begining.mp3", "static")
    music1:setVolume(0.2)
    music1:play()

    -- https://uppbeat.io/sfx/category/gaming
    -- https://sounds.spriters-resource.com/
    local sound1 = love.audio.newSource("assets/sounds/select_change.mp3", "static")
    sound1:setVolume(0.2)
    sound1:play()

    -- sound:stop()
    -- sound:pause()
    Window:setup()
    World:loadScenes()
    World.scenes.start.load()
end

-- love.window.close()