-- DEPENDENCIES

    -- Default
    Config  = require("game.config")
    World   = require("jflua.jfres.world")
    data    = require("jflua.jfdata.data")
    
    -- Extra
    Card    = require("jflua.jfitem.card")
    Btn     = require("jflua.jfitem.btn")
    Text    = require("jflua.jfitem.text")



-- START GAME
function love.load()
    World:setup()
    World:loadScenes()
    World.scenes.start.load()
end
