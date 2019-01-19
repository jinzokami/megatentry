music = {}

music.map = {}
music.map[1] = love.audio.newSource("bgm/PLACEHOLDER WALKING.mp3", "stream")

music.misc = {}
music.misc.save = love.audio.newSource("bgm/PLACEHOLDER SAVE.mp3", "stream")

current_song = music.map[1]

BGM = {}
function BGM.play()
	love.audio.setVolume(0)
	current_song:play()
end

function BGM.update()
	if current_song:isPlaying() == false then
		current_song:play()
	end
end

function BGM.set(ns)
	current_song:stop()
	current_song = ns
end

function BGM.switch(ns)
	current_song:stop()
	current_song = ns
	current_song:play()
end