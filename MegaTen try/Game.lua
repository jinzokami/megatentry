require("MapManager")
require("BGM")
require("Roaming")
require("MessageBox")
Player = require("Player")

Game = {}
scale = 3
function Game.load()
	Player.load()
	MessageBox.load()
	Roaming.load()

	BGM.set(music.map[1])
	BGM.play()
end

function Game.update(dt)
	MessageBox.update(dt)
	BGM.update()
	Roaming.update(dt)
	
end

function Game.draw()
	love.graphics.push()
	love.graphics.scale(1)

	MessageBox.draw()
	Roaming.draw()

	love.graphics.pop()

	love.graphics.print(direction,0,0)
end

function Game.keypressed(key)
	Roaming.keypressed(key)
	if key == ' ' then
		pushMessage({text = "tremble", color = {255,255,255,255}, tremble = true})
	end

	if key == 'a' then
		pushMessage({text = "long test string to make for great honor and proud country of good people. I'm gonna make it longer to see if this will truly work and also to test if i can keep a word from being split on a newline.", color = {255,255,255,255}, tremble = false})
	end
end

function getmap(map, x, y)
	if map[y] and map[y][x] then
		return map[y][x]
	else 
		return 1
	end
end

function pushMessage(message)
	MessageBox.pushMessage(message)
end