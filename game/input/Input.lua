local Entity = require('Entity')

local Keyboard = require('game.input.Keyboard')

local Input = Entity:extend()

function Input:new()
	self.keyboard = Keyboard()
end

function Input:button(button)
	self.skip = true
	self.parent:button(button)
end

return Input