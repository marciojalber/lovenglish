-- DEPENDENCIES

    -- Default
    Config      = require("game.config")
    Window      = require("game.window")
    World       = require("jflua.jfres.world")
    Sound       = require("jflua.jfres.sound_control")
    data        = require("jflua.jfdata.data")

    -- Extra
    BaseItem    = require("jflua.jfitem.base_item")
    Card        = require("jflua.jfitem.card")
    Btn         = require("jflua.jfitem.btn")
    Text        = require("jflua.jfitem.text")


    
    -- START GAME
function love.load()
    Window:setup()
    World:addScene("start")
    World:addScene("ui")
    World.scenes.start.load()
    World.scenes.ui.load()
end

-- love.window.close()