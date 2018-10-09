local Entity = require('Entity')
local Button = require('game.Button')

local GameScene = Entity:extend()

function GameScene:new(size)
	self.size = size
	self.buttons = Entity()

	for y = 1, size do
		for x = 1, size do
			self.buttons[(y - 1) * size + x] = Button(x, y)
		end
	end
end

function GameScene:key(key)
	print(key)
end

function GameScene:draw()
	love.graphics.push()
	love.graphics.scale(
		love.graphics.getWidth() / self.size,
		love.graphics.getHeight() / self.size
	)

	if love.keyboard.isDown('space') then
		self.buttons:callSkip()
	end
end

function GameScene:drawEnd()
	love.graphics.pop()
end

return GameScene