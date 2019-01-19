Radar = {}

function Radar.load()
	images.Radar_Blue = love.graphics.newImage("images/radar/Radar_Blue.png")
	images.Radar_Green = love.graphics.newImage("images/radar/Radar_Green.png")
	images.Radar_Red = love.graphics.newImage("images/radar/Radar_Red.png")
end

function Radar.update(dt)

end

function Radar.draw(sx, sy)
	love.graphics.push()
	love.graphics.scale(3)

	love.graphics.setColor(255,255,255,255)
	if Roaming.enc_steps > 6 then
		love.graphics.draw(images.Radar_Blue, sx, sy)
	elseif Roaming.enc_steps <= 4 then
		love.graphics.draw(images.Radar_Red, sx, sy)
	elseif Roaming.enc_steps <= 6 then
		love.graphics.draw(images.Radar_Green, sx, sy)
	end
	love.graphics.pop()
end