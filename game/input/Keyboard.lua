local Input = require('game.input.Input')

local Keyboard = Input:extend()

function Keyboard:key(key)
	if key == 'left' or key == 'a' then
		self:callButton('left')
	elseif key == 'right' or key == 'd' then
		self:callButton('right')
	elseif key == 'up' or key == 'w' then
		self:callButton('up')
	elseif key == 'down' or key == 's' then
		self:callButton('down')
	elseif key == 'space' or key == 'return' then
		self:callButton('action')
	end
end

return Keyboard