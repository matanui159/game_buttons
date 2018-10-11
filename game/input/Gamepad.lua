local Input = require('game.input.Input')

local Gamepad = Input:extend()

function Gamepad:new(joystick)
	self.joystick = joystick
end

function Gamepad:gamepad(gamepad, button)
	if gamepad == self.joystick then
		if button == 'dpleft' then
			self:callButton('left')
		elseif button == 'dpright' then
			self:callButton('right')
		elseif button == 'dpup' then
			self:callButton('up')
		elseif button == 'dpdown' then
			self:callButton('down')
		else
			self:callButton('action')
		end
	end
end

return Gamepad