local Entity = require('Entity')
local Button = require('game.Button')

local Input = require('game.input.Keyboard')

local GameScene = Entity:extend()

function GameScene:new(size)
	self.size = size
	self.buttons = Entity()
	self.input = Input()

	for y = 1, size do
		for x = 1, size do
			self.buttons[(y - 1) * size + x] = Button(x, y)
		end
	end
end

function GameScene:input(input)
	print(input)
end

function GameScene:draw()
	love.graphics.push()
	love.graphics.scale(
		love.graphics.getWidth() / self.size,
		love.graphics.getHeight() / self.size
	)
end

function GameScene:drawEnd()
	love.graphics.pop()
end

return GameScene