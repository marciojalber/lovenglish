-- DEPENDENCIES
utf8    = require("utf8")
Card    = require("jflua.jfitem.card")
Text    = require("jflua.jfitem.text")
World   = require("jflua.jfres.world")
Config  = require("game.config")



-- START GAME
function love.load()
    World:setup()
    World:loadScenes()
    World.scenes.start.load()
end
