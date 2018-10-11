local Entity = require('Entity')
local Button = require('game.Button')
local Player = require('game.Player')
local AllInput = require('game.input.AllInput')

local GameScene = Entity:extend()

function GameScene:new(size)
	size = size or 3
	self.size = size
	self.player = Player(AllInput())

	self.buttons = Entity()
	for y = 1, size do
		for x = 1, size do
			self.buttons[(y - 1) * size + x] = Button(x - 1, y - 1, size)
		end
	end
	self.count = size * size

	self.timer = 0
	self.shake = {
		pow = 0,
		x = 0,
		y = 0
	}
end

function GameScene:clear(x, y)
	if self.buttons[y * self.size + x + 1]:clear() then
		self.shake.pow = 100
		self.count = self.count - 1
		if self.count == 0 then
			Entity.root = GameScene(self.size + 1)
			Entity.root.player = self.player
			Entity.root.shake = self.shake
		end
	end
end

function GameScene:update(dt)
	self.timer = self.timer + dt
	if self.timer >= 0.03 then
		self.shake.pow = self.shake.pow / 2
		self.shake.x = (love.math.random() - 0.5) * self.shake.pow
		self.shake.y = (love.math.random() - 0.5) * self.shake.pow
		self.timer = self.timer - 0.03
	end
end

function GameScene:draw()
	love.graphics.push()
	love.graphics.translate(self.shake.x, self.shake.y)
	love.graphics.scale(
		love.graphics.getWidth() / self.size,
		love.graphics.getHeight() / self.size
	)
end

function GameScene:drawEnd()
	self:callTree('postDraw')
	love.graphics.pop()
end

function GameScene:lose()
	Entity.root = GameScene()
end

return GameScene