local Entity = require('Entity')
local Button = require('game.Button')

local Grid = Entity:extend()

function Grid:new(size)
	self.size = size
	for y = 1, size do
		for x = 1, size do
			self[(y - 1) * size + x] = Button(x - 1, y - 1, size)
		end
	end
end

function Grid:get(x, y)
	return self[y * self.size + x + 1]
end

return Grid