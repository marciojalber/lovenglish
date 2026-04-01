-- Music by <a href="https://pixabay.com/users/joyinsound-51634429/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=391742">JoyInSound</a> from <a href="https://pixabay.com/music//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=391742">Pixabay</a>
-- https://uppbeat.io/sfx/category/gaming
-- https://sounds.spriters-resource.com/


-- DATA
local audio = {
    -- Itens
    maxVoices   = 20,
    activeMusic = nil,
    active      = {},
    volume      = {
        master  = 1.0, -- global
        music   = 0.4, -- apart
        env     = 0.5, -- env
        sfx     = 1.0, -- actors / hits / storms
        ui      = 1.0, -- ui
    },
    priori      = {
        env     = 1,
        actors  = 2,
        hits    = 3,
        storms  = 4,
        ui      = 5,
    },
}

if Config.audio and Config.audio.volume and Config.audio.volume.music then
    audio.volume.music = Config.audio.volume.music
end

if Config.audio and Config.audio.volume and Config.audio.volume.sfx then
    audio.volume.sfx = Config.audio.volume.sfx
end

function audio:load(group, name)
    local source = Config.audio.sources[group][name]
    return {
        group   = group,
        source  = love.audio.newSource("assets/" .. source[2], source[1]),
    }
end

function audio:play(sound)
    -- Clean stopped sounds first
    self:cleanup()

    if #self.active >= self.maxVoices then
        self:resolveVoice(sound)
    end

    if #self.active < self.maxVoices then
        self:start(sound)
        return
    end
end

function audio:cleanup()
    for i = #self.active, 1, -1 do
        if not self.active[i].source:isPlaying() then
            table.remove(self.active, i)
        end
    end
end

function audio:resolveVoice(source)
    if sound.group == "music" then
        return
    end

    local priority = self.priori[sound.group]
    local lowestIndex = 1
    local lowestPriority = self.priori.ui

    for i, v in ipairs(self.active) do
        if v.priority < lowestPriority then
            lowestPriority = v.priority
            lowestIndex = i
        end
    end

    -- Replace only if new one is more important
    if priority > lowestPriority then
        self.active[lowestIndex].source:stop()
        table.remove(self.active, lowestIndex)
    end
end

function audio:start(sound, group)
    local s         = sound.source:clone()
    local volume    =
        self.volume.master *
        (self.volume[sound.group])
    
    s:setVolume(volume)
    s:play()

    if sound.group == "music" then
        if self.activeMusic and self.activeMusic:isPlaying() then
            self.activeMusic:stop()
        end
        self.activeMusic = {
            source = sound.source,
        }
        return
    end

    table.insert(self.active, {
        group       = sound.group,
        source      = sound.source,
        priority    = self.priori[sound.group],
    })
end

function audio:updateVolumes()
    if self.activeMusic then
        local volume = self.volume.master * self.volume.music
        self.activeMusic.source:setVolume(volume)
    end

    for _, v in pairs(self.active) do
        local volume = self.volume.master * self.volume[v.group]
        v.source:setVolume(volume)
    end
end

-- RETURN DATA
return audio
