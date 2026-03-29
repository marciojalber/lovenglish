-- Music by <a href="https://pixabay.com/users/joyinsound-51634429/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=391742">JoyInSound</a> from <a href="https://pixabay.com/music//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=391742">Pixabay</a>
-- https://uppbeat.io/sfx/category/gaming
-- https://sounds.spriters-resource.com/

-- DATA
local sound = {
    -- Itens
    volume      = {
        fx      = 0.5,
        ms      = 0.5,
    },
}

if Config.soundCtrl.volumeMs then
    sound.volume.ms = Config.soundCtrl.volumeMs
end

if Config.soundCtrl.volumeFx then
    sound.volume.fx = Config.soundCtrl.volumeFx
end

function sound:fx(source)
    local res = Config.sounds[source]:clone()
    res:setVolume(sound.volume.fx)
    return res
end

function sound:ms(source)
    local res = Config.musics[source]:clone()
    res:setVolume(sound.volume.ms)
    return res
end

-- RETURN DATA
return sound
