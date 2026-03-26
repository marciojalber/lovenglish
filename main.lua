-- DEPENDENCIES
utf8    = require("utf8")
Card    = require("jflua.jfitem.card")
Text    = require("jflua.jfitem.text")
World   = require("jflua.jfres.world")



-- START GAME
function love.load()
    World:setup()
    World:loadScenes()
    World.scenes.start.load()
end
