-- DEPENDENCIES

    -- Default
    Config  = require("game.config")
    World   = require("jflua.jfres.world")
    
    -- Extra
    Card    = require("jflua.jfitem.card")
    Text    = require("jflua.jfitem.text")



-- START GAME
function love.load()
    World:setup()
    World:loadScenes()
    World.scenes.start.load()
end
