local Entity = require('Entity')

local Button = Entity:extend()

function Button:new(x, y)
	self.x = x
	self.y = y
end

function Button:draw()
	local x = self.x - 1
	local y = self.y - 1
	love.graphics.rectangle('fill', x + 0.1, y + 0.1, 0.8, 0.8)
end

return Button