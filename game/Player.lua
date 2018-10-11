local Entity = require('Entity')

local Player = Entity:extend()

function Player:new(input)
	self.input = input
	self.x = 0
	self.y = 0
end

function Player:button(button)
	if button == 'left' then
		self.x = self.x - 1
	elseif button == 'right' then
		self.x = self.x + 1
	elseif button == 'up' then
		self.y = self.y - 1
	elseif button == 'down' then
		self.y = self.y + 1
	elseif button == 'action' then
		self.parent:clear(self.x, self.y)
	end
	self.x = self.x % self.parent.size
	self.y = self.y % self.parent.size
end

function Player:draw()
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.setLineWidth(0.1)
	love.graphics.rectangle('line', self.x + 0.05, self.y + 0.05, 0.9, 0.9)
end

return Player