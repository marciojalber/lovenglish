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



-- START GAME
function love.load()
    Window:setup()
    World:loadScenes()
    World.scenes.start.load()
end
