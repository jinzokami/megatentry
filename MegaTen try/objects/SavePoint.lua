SavePoint = {}

function SavePoint.new()
	save = false
end

function SavePoint:update()

end

function SavePoint:draw(x, y)

end

function SavePoint:save()
	save = Game
end

function SavePoint:load()
	if save then Game = save else Game.load() end
end