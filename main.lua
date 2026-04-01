-- DEPENDENCIES

    -- Default
    Config      = require("game.config")
    Window      = require("game.window")
    World       = require("jflua.jfres.world")
    Audio       = require("jflua.jfres.audio")
    Image       = require("jflua.jfres.image")
    data        = require("jflua.jfdata.data")

    -- Extra
    BaseItem    = require("jflua.jfitem.base_item")
    Card        = require("jflua.jfitem.card")
    Btn         = require("jflua.jfitem.btn")
    Text        = require("jflua.jfitem.text")
    Img         = require("jflua.jfitem.img")


    
-- START GAME
function love.load()
    local imageData = love.image.newImageData("assets/img/cursor1-24.png")
    local cursor    = love.mouse.newCursor(imageData, 0, 0)
    love.mouse.setCursor(cursor)

    Window:setup()
    World:addScene("start")
    World:addScene("ui")
    World.scenes.start.load()
    World.scenes.ui.load()
end
