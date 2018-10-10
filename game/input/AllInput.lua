local Input = require('game.input.Input')

local Keyboard = require('game.input.Keyboard')

local AllInput = Input:extend()

function AllInput:new()
	self.keyboard = Keyboard()
end

function AllInput:button(button)
	self.skip = true
	self:callButton(button)
end

return AllInput