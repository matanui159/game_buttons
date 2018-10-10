local Input = require('game.input.Input')

local Keyboard = Input:extend()

function Keyboard:key(key)
	print(key)
	if key == 'left' or key == 'a' then
		self:callInput('left')
	elseif key == 'right' or key == 'd' then
		self:callInput('right')
	elseif key == 'up' or key == 'w' then
		self:callInput('up')
	elseif key == 'down' or key == 's' then
		self:callInput('down')
	elseif key == 'space' or key == 'return' then
		self:callInput('action')
	end
end

return Keyboard