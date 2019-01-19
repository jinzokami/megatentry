require("minimap")
require("radar")
require("PlayScreen")

Roaming = {}
Roaming.enc_steps = 10

function Roaming.load()
	map = new_map("start")

	for i = 1, #map, 1 do
		for j = 1, #map[1] do
			if map[i][j] == 2 then
				x = j
				y = i
			end
		end
	end
	direction = "north"
	PlayScreen.load()
	PlayScreen.decide_walls(map, x, y, direction)
	MiniMap.load()
	Radar.load()	
end

function Roaming.update(dt)
	MiniMap:update(dt)
	PlayScreen:update()
	PlayScreen.decide_walls(map, x, y, direction)
	Radar.update()
	if Roaming.enc_steps <= 0 then
		--start a random encounter here
		Roaming.enc_steps = 10
	end

	if moved then
		Roaming.enc_steps = Roaming.enc_steps - 1
	end
	moved = false
end

function Roaming.draw()
	PlayScreen:draw(60,0)
	MiniMap:draw(map,180,0,x,y)
	Radar.draw(180, 100)
end

function Roaming.keypressed(key)
	if key == 'up' then
		if (direction == 'north') and getmap(map, x, y-1) ~= 1 then
			y = y - 1
			moved = true
		elseif (direction == 'south') and getmap(map, x, y+1) ~= 1 then
			y = y + 1
			moved = true
		elseif (direction == 'east') and getmap(map, x+1, y) ~= 1 then
			x = x + 1
			moved = true
		elseif (direction == 'west') and getmap(map, x-1, y) ~= 1 then
			x = x - 1
			moved = true
		end
	end

	if key == 'down' then
		if (direction == 'north') and getmap(map, x, y+1) ~= 1 then
			y = y + 1
			moved = true
		elseif (direction == 'south') and getmap(map, x, y-1) ~= 1 then
			y = y - 1
			moved = true
		elseif (direction == 'east') and getmap(map, x-1, y) ~= 1 then
			x = x - 1
			moved = true
		elseif (direction == 'west') and getmap(map, x+1, y) ~= 1 then
			x = x + 1
			moved = true
		end
	end

	if key == 'left' then
		if direction == 'north' then
			direction = 'west'
		elseif direction == 'west' then
			direction = 'south'
		elseif direction == 'south' then
			direction = 'east'
		elseif direction == 'east' then
			direction = 'north'
		end
	end

	if key == 'right' then
		if direction == 'north' then
			direction = 'east'
		elseif direction == 'east' then
			direction = 'south'
		elseif direction == 'south' then
			direction = 'west'
		elseif direction == 'west' then
			direction = 'north'
		end
	end
end

function Roaming.reenter()
	Roaming = oldRoam
end

function Roaming.save()
	oldRoam = Roaming
end