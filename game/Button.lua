local Entity = require('Entity')

local Button = Entity:extend()

function Button:new(x, y, size)
	self.x = x
	self.y = y
	
	local rand = love.math.random()
	self.timer = rand * size
end

function Button:button()
	if self.timer < 0 then
		self.clear = true
	end
end

function Button:draw()
	if not self.clear then
		if self.timer > 0 then
			love.graphics.setColor(0, 1, 0, 1)
		else
			love.graphics.setColor(1 + self.timer, 0, 0, 1)
		end
		love.graphics.rectangle('fill', self.x + 0.1, self.y + 0.1, 0.8, 0.8)
	end
end

function Button:update(dt)
	if not self.clear then
		self.timer = self.timer - dt / self.parent.size
		if self.timer < -1 then
			self.root:callTree('lose')
		end
	end
end

return Button