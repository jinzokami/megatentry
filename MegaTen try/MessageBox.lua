MessageBox = {}

function MessageBox.load()
	images.MessageBox = love.graphics.newImage("images/messagebox/messagebox.png")
	fonts[1] = love.graphics.newFont("fonts/manafont.ttf")
	MessageBox.messages = {}

end

function MessageBox.update(dt)
	if #MessageBox.messages > 23 then --pop them one at a time to get that cool scrolling effect
		MessageBox.popMessage()
	end

	MessageBox.tremble_offset = { x = (math.random()*2)-1, y = (math.random()*2)-1}
end

function MessageBox.draw()
	love.graphics.push()
	love.graphics.scale(scale)

	love.graphics.draw(images.MessageBox,0,0)
	
	love.graphics.pop()

	love.graphics.setFont(fonts[1])
	for i = 1, #MessageBox.messages, 1 do
		love.graphics.setColor(MessageBox.messages[i].color or {255,255,255,255})
		if MessageBox.messages[i].tremble then
			love.graphics.print(MessageBox.messages[i].text, 2+MessageBox.tremble_offset.x, i*(20)+MessageBox.tremble_offset.y)
		else
			love.graphics.print(MessageBox.messages[i].text, 2, i*(20))
		end
	end
end

function MessageBox.pushMessage(message)
	--make it so words don't get chopped up on newline
	--also try using gmatch to color text, eventually
	local messages = {} --add a table to temporarily hold our text segments

	local cutoff = 22
	while message.text:len() > cutoff do --while the string is too long...
		cutoff = 22
		--if the 20th char is not a space...
		while message.text:sub(cutoff, cutoff) ~= ' ' do--check the char before it and the one before that until there is a space
			cutoff = cutoff - 1
			if cutoff < 1 then
				cutoff = 22
				break
			end
		end
		table.insert(messages, {text = message.text:sub(1, cutoff), color = message.color, tremble = message.tremble})--grab the first x chars and add them to our queue
		
		message.text = message.text:sub(cutoff + 1, message.text:len())--remove the first x chars
		while message.text:sub(1, 1) == ' ' do--while the first char of the new line iss a space
			message.text = message.text:sub(2, message.text:len())--remove the first char
		end
	end
	table.insert(messages, message)--insert the last segment

	--add all segments to the message box
	for i = 1, #messages, 1 do
		table.insert(MessageBox.messages, messages[i])
	end
end

function MessageBox.popMessage()
	table.remove(MessageBox.messages, 1)
end