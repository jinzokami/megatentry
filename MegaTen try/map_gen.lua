--[[i seriously need to comment this. but i won't]]
local empty = 0
local filled = 1
local spawn = 2
local chest = 3
local exit = 4
local outside = 5
local baddy = 6

function new_map(size)
	local map = generate_map(size)
	empty_map(map)
	return map
end

function generate_map(size)
	local map = {}
	map[1] = {}
	map[1][1] = spawn
	map.spawn = {}

	local current_x, current_y = 1, 1
	local desired_walls_cleared = size
	local walls_cleared = 1
	while walls_cleared < desired_walls_cleared do
		local direction = math.floor(math.random(1, 4.999))

		if direction == 1 then
			current_x = current_x + 1
		elseif direction == 2 then
			current_x = current_x - 1
		elseif direction == 3 then
			current_y = current_y + 1
		elseif direction == 4 then
			current_y = current_y - 1
		end

		if current_x < 1 then
			current_x = 1
			for i = 1, #map do
				table.insert(map[i], 1, filled)
			end
		end

		if current_x > #map[1] then
			for i = 1, #map do
				table.insert(map[i], filled)
			end
		end

		if current_y < 1 then
			current_y = 1
			new_row = {}
			for i = 1, #map[1] do
				table.insert(new_row, filled)
			end
			table.insert(map, 1, new_row)
		end

		if current_y > #map then
			new_row = {}
			for i = 1, #map[1] do
				table.insert(new_row, filled)
			end
			table.insert(map, new_row)
		end

		if map[current_y][current_x] == filled then
			map[current_y][current_x] = empty
			walls_cleared = walls_cleared + 1
		end
	end

	map[current_y][current_x] = exit

	for i = 1, #map do
		for j = 1 , #map[1] do
			if map[i][j] == spawn then 
				map.spawn.x = j 
				map.spawn.y = i
			end
		end
	end

	return map
end

function empty_map(map)
	coords_to_empty = {}
	for y = 1, #map, 1 do
		for x = 1, #map[1], 1 do
			if x > 1 and y > 1 and x < #map[1] and y < #map then
				if (map[y-1][x]==filled) then
					if (map[y+1][x]==filled) then
						if (map[y][x-1]==filled) then
							if (map[y][x+1]==filled) then
								table.insert(coords_to_empty,x)
								table.insert(coords_to_empty,y)
							end
						end
					end
				end
			end
		end
	end

	for i = 1, #coords_to_empty, 2 do
		map[coords_to_empty[i+1]][coords_to_empty[i]] = outside
	end
end