MiniMap = {}

function MiniMap.load()
	images.Map_Grid = love.graphics.newImage("images/map/Map_Grid.png")
	images.Map_Cell = love.graphics.newImage("images/map/Map_Cell.png")
	images.Map_Location = love.graphics.newImage("images/map/Map_Location.png")	
	MiniMap.timer = 0
end

function MiniMap:update(dt)
	MiniMap.timer = 2*math.pi % (MiniMap.timer + dt)
	MiniMap.hazardTransparency = math.sin(MiniMap.timer) * 255
end

function MiniMap:draw(map, sx, sy, px, py)
	love.graphics.push()
	love.graphics.scale(scale
		)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(images.Map_Grid, sx, sy)
	for y = 1, #map, 1 do
		for x = 1, #map[1], 1 do
			if (getmap(map, x, y) == 0) and (x - px <= 7) and (x - px >= -7) and (y - py <= 7) and (y - py >= -7) then
				love.graphics.setColor(255,255,255,255)
				love.graphics.draw(images.Map_Cell, sx+(4*7)+(x-px)*4, sy+(4*7)+(y-py)*4)
			elseif (getmap(map, x, y) == 2) and (x - px <= 7) and (x - px >= -7) and (y - py <= 7) and (y - py >= -7) then
				love.graphics.setColor(10,255,10,255)
				love.graphics.draw(images.Map_Cell, sx+(4*7)+(x-px)*4, sy+(4*7)+(y-py)*4)
			elseif (getmap(map, x, y) == 3) and (x - px <= 7) and (x - px >= -7) and (y - py <= 7) and (y - py >= -7) then
				love.graphics.setColor(255,10,10,255)
				love.graphics.draw(images.Map_Cell, sx+(4*7)+(x-px)*4, sy+(4*7)+(y-py)*4)
			end 
		end
	end
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(images.Map_Location, sx+4*7, sy+4*7)
	
	love.graphics.pop()
end