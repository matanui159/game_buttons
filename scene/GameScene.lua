local Entity = require('Entity')
local Grid = require('game.Grid')
local Button = require('game.Button')
local Player = require('game.Player')
local Input = require('game.input.Input')

local GameScene = Entity:extend()

function GameScene:new(size)
	self.grid = Grid(size)
	self.player = Player(Input())
end

function GameScene:button(button)
	self.grid:get(self.player.x, self.player.y):button(button)

	local win = true
	for _, button in ipairs(self.grid) do
		if not button.clear then
			win = false
		end
	end
	if win then
		Entity.root = GameScene(self.grid.size + 1)
	end
end

function GameScene:draw()
	love.graphics.push()
	love.graphics.scale(
		love.graphics.getWidth() / self.grid.size,
		love.graphics.getHeight() / self.grid.size
	)
end

function GameScene:drawEnd()
	love.graphics.pop()
end

function GameScene:lose()
	print('LOSE')
end

return GameScene