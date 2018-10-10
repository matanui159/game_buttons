local Entity = require('Entity')

local Keyboard = Entity:extend()

function Keyboard:key(key)
	if key == 'left' or key == 'a' then
		self.parent:button('left')
	elseif key == 'right' or key == 'd' then
		self.parent:button('right')
	elseif key == 'up' or key == 'w' then
		self.parent:button('up')
	elseif key == 'down' or key == 's' then
		self.parent:button('down')
	elseif key == 'space' or key == 'return' then
		self.parent:button('action')
	end
end

return Keyboard