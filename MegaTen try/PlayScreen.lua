PlayScreen = {}

function PlayScreen.load()
	images.Background_Too_Far = love.graphics.newImage("images/tileset/Background_Too_Far.png")
	images.Background_Far = love.graphics.newImage("images/tileset/Background_Far.png")
	images.Background_Near = love.graphics.newImage("images/tileset/Background_Near.png")

	images.Wall_Further_Left = love.graphics.newImage("images/tileset/Wall_Further_Left.png")
	images.Wall_Further_Right = love.graphics.newImage("images/tileset/Wall_Further_Right.png")

	images.Wall_Far_Left = love.graphics.newImage("images/tileset/Wall_Far_Left.png")
	images.Wall_Far_Right = love.graphics.newImage("images/tileset/Wall_Far_Right.png")

	images.Wall_Near_Left = love.graphics.newImage("images/tileset/Wall_Near_Left.png")
	images.Wall_Near_Right = love.graphics.newImage("images/tileset/Wall_Near_Right.png")

	images.Floor_Far = love.graphics.newImage("images/tileset/Floor_Far.png")
	images.Floor_Near = love.graphics.newImage("images/tileset/Floor_Near.png")	
end

function PlayScreen:update(dt)
end

function PlayScreen:draw(sx,sy)
	love.graphics.push()
	love.graphics.scale(scale)
	love.graphics.setColor(0,100,0,255)
	
	if Background == "too far" then
		love.graphics.draw(images.Background_Too_Far, sx, sy)
	end

	if Floor == "far" then
		love.graphics.draw(images.Floor_Far, sx, sy)
		love.graphics.draw(images.Floor_Near, sx, sy)
	end

	if Floor == "near" then
		love.graphics.draw(images.Floor_Near, sx, sy)
	end

	if (walls.further.left == true) and (Floor == "far") then
		love.graphics.draw(images.Wall_Further_Left, sx, sy)
	end

	if (walls.further.right == true) and (Floor == "far") then
		love.graphics.draw(images.Wall_Further_Right, sx, sy)
	end

	if Background == "far" then
		love.graphics.draw(images.Background_Far, sx, sy)
	end

	if Floor == "far" then
		love.graphics.draw(images.Floor_Far, sx, sy)
		love.graphics.draw(images.Floor_Near, sx, sy)
	end

	if (walls.far.left == true) and (Floor == "far") then
		love.graphics.draw(images.Wall_Far_Left, sx, sy)
	end

	if (walls.far.right == true) and (Floor == "far") then
		love.graphics.draw(images.Wall_Far_Right, sx, sy)
	end

	if Background == "near" then
		love.graphics.draw(images.Background_Near, sx, sy)
	end

	if Floor == "near" then
		love.graphics.draw(images.Floor_Near, sx, sy)
	end

	if walls.near.left == true then
		love.graphics.draw(images.Wall_Near_Left, sx, sy)
	end

	if walls.near.right == true then
		love.graphics.draw(images.Wall_Near_Right, sx, sy)
	end

	love.graphics.pop()
end

function PlayScreen.decide_walls(map, x, y, direction)
	walls = {}
	walls.near = {}
	walls.far = {}
	walls.further = {}

	if direction == "north" then
		if getmap(map, x, y-1) ~= 1 then
			if getmap(map, x, y-2) ~= 1 then
				Background = "too far"
				Floor = "far"
			else
				Background = "far"
				Floor = "far"
			end
		else
			Background = "near"
			Floor = "near"
		end

		if getmap(map, x-1, y) ~= 1 then
			walls.near.left = false
		else
			walls.near.left = true
		end

		if getmap(map, x+1, y) ~= 1 then
			walls.near.right = false
		else
			walls.near.right = true
		end

		if getmap(map, x-1, y-1) ~= 1 then
			walls.far.left = false
		else
			walls.far.left = true
		end

		if getmap(map, x+1, y-1) ~= 1 then
			walls.far.right = false
		else
			walls.far.right = true
		end
		
		if getmap(map, x-1, y-2) ~= 1 then
			walls.further.left = false
		else
			walls.further.left = true
		end

		if getmap(map, x+1, y-2) ~= 1 then
			walls.further.right = false
		else
			walls.further.right = true
		end
	end

	if direction == "south" then
		if getmap(map, x, y+1) ~= 1 then
			if getmap(map, x, y+2) ~= 1 then
				Background = "too far"
				Floor = "far"
			else
				Background = "far"
				Floor = "far"
			end
		else
			Background = "near"
			Floor = "near"
		end

		if getmap(map, x+1, y) ~= 1 then
			walls.near.left = false
		else
			walls.near.left = true
		end

		if getmap(map, x-1, y) ~= 1 then
			walls.near.right = false
		else
			walls.near.right = true
		end

		if getmap(map, x+1, y+1) ~= 1 then
			walls.far.left = false
		else
			walls.far.left = true
		end

		if getmap(map, x-1, y+1) ~= 1 then
			walls.far.right = false
		else
			walls.far.right = true
		end

		if getmap(map, x+1, y+2) ~= 1 then
			walls.further.left = false
		else
			walls.further.left = true
		end

		if getmap(map, x-1, y+2) ~= 1 then
			walls.further.right = false
		else
			walls.further.right = true
		end
	end

	if direction == "east" then
		if getmap(map, x+1, y) ~= 1 then
			if getmap(map, x+2, y) ~= 1 then
				Background = "too far"
				Floor = "far"
			else
				Background = "far"
				Floor = "far"
			end
		else
			Background = "near"
			Floor = "near"
		end

		if getmap(map, x, y-1) ~= 1 then
			walls.near.left = false
		else
			walls.near.left = true
		end

		if getmap(map, x, y+1) ~= 1 then
			walls.near.right = false
		else
			walls.near.right = true
		end

		if getmap(map, x+1, y-1) ~= 1 then
			walls.far.left = false
		else
			walls.far.left = true
		end

		if getmap(map, x+1, y+1) ~= 1 then
			walls.far.right = false
		else
			walls.far.right = true
		end

		if getmap(map, x+2, y-1) ~= 1 then
			walls.further.left = false
		else
			walls.further.left = true
		end

		if getmap(map, x+2, y+1) ~= 1 then
			walls.further.right = false
		else
			walls.further.right = true
		end
	end

	if direction == "west" then
		if getmap(map, x-1, y) ~= 1 then
			if getmap(map, x-2, y) ~= 1 then
				Background = "too far"
				Floor = "far"
			else
				Background = "far"
				Floor = "far"
			end
		else
			Background = "near"
			Floor = "near"
		end

		if getmap(map, x, y+1) ~= 1 then
			walls.near.left = false
		else
			walls.near.left = true
		end

		if getmap(map, x, y-1) ~= 1 then
			walls.near.right = false
		else
			walls.near.right = true
		end

		if getmap(map, x-1, y+1) ~= 1 then
			walls.far.left = false
		else
			walls.far.left = true
		end

		if getmap(map, x-1, y-1) ~= 1 then
			walls.far.right = false
		else
			walls.far.right = true
		end

		if getmap(map, x-2, y+1) ~= 1 then
			walls.further.left = false
		else
			walls.further.left = true
		end

		if getmap(map, x-2, y-1) ~= 1 then
			walls.further.right = false
		else
			walls.further.right = true
		end
	end
end