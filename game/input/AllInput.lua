local Input = require('game.input.Input')

local Keyboard = require('game.input.Keyboard')
local Gamepad = require('game.input.Gamepad')

local AllInput = Input:extend()

function AllInput:new()
	self.keyboard = Keyboard()
	for i, joystick in ipairs(love.joystick.getJoysticks()) do
		if joystick:isGamepad() then
			self['gamepad' .. i] = Gamepad(joystick)
		end
	end
end

function AllInput:button(button)
	self.skip = true
	self:callButton(button)
end

return AllInput