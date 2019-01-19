--[[TODO
make exits do something
add hazards
add doors - and locked ones too
start on making the battle system
add an overworld map eventually
implement saving and loading eventually

the radar will items and special enemies, like in strange journey (eventually, but it's nice to have a plan)

removed messages are saved to a seperate table
every 10 messages the messages are recorded to an external file along with the time they were backed up

PushMessage may or may not include the ability to change color mid-text
for mid text color change we'd need to add tags and whatnot to the speech text]]

love.graphics.setDefaultFilter('nearest', 'nearest', 0)
love.graphics.setBackgroundColor(50,50,100,255)

images = {}
sound = {}
fonts = {}

require("Game")

function love.load()
	math.randomseed(os.time());math.random();math.random();math.random()

	target_framerate = 1/30
	remaining_time = love.timer.getTime()

	Game.load()
end

function love.update(dt)
	remaining_time = remaining_time + target_framerate
	Game.update(dt)
end

function love.draw()
	Game.draw()

	local current_time = love.timer.getTime()
	if remaining_time <= current_time then
		remaining_time = current_time
		return
	end
	love.timer.sleep(remaining_time - current_time)
end

function love.keypressed(key)
	Game.keypressed(key)
end

--no messing with this unless ABSOLUTELY necessary, which it will never be
function love.run()
 
	if love.math then
		love.math.setRandomSeed(os.time())
		for i=1,3 do love.math.random() end
	end
 
	if love.event then
		love.event.pump()
	end
 
	if love.load then love.load(arg) end
 
	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then love.timer.step() end
 
	local dt = 0
 
	-- Main loop time.
	while true do
		-- Process events.
		if love.event then
			love.event.pump()
			for e,a,b,c,d in love.event.poll() do
				if e == "quit" then
					if not love.quit or not love.quit() then
						if love.audio then
							love.audio.stop()
						end
						return
					end
				end
				love.handlers[e](a,b,c,d)
			end
		end
 
		-- Update dt, as we'll be passing it to update
		if love.timer then
			love.timer.step()
			dt = love.timer.getDelta()
		end
 
		-- Call update and draw
		if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
 
		if love.window and love.graphics and love.window.isCreated() then
			love.graphics.clear()
			love.graphics.origin()
			if love.draw then love.draw() end
			love.graphics.present()
		end
 
		if love.timer then love.timer.sleep(0.001) end
	end
 
end