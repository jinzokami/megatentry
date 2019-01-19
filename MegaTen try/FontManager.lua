FontManager = {}

function FontManager.load()
	
end

function FontManager.switchFont(new_font)
	love.graphics.setFont(fonts[new_font])
end