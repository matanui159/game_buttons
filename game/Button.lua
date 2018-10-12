local Entity = require('Entity')

local Button = Entity:extend()

function Button:new(x, y, size)
	self.x = x
	self.y = y
	self.size = size
	self.timer = size * (1 - math.pow(love.math.random(), 1.5))
end

function Button:clear()
	if self.timer < 0 and not self.win then
		self.win = true
		self.vel = -10
		return true
	end
	return false
end

function Button:draw()
	if not self.win then
		local size = 0.8
		if self.timer > 0 then
			love.graphics.setColor(0, 0, 1, 1)
		else
			love.graphics.setColor(1, 0, 0, 1)
			size = size * (1 + self.timer)
		end
		love.graphics.rectangle('fill',
			self.x + 0.5 - size / 2,
			self.y + 0.5 - size / 2,
			size,
			size
		)
	end
end

function Button:postDraw()
	if self.win then
		local size = 0.8 * (1 + self.timer)
		love.graphics.setColor(0, 1, 0, 1)
		love.graphics.rectangle('fill',
			self.x + 0.5 - size / 2,
			self.y + 0.5 - size / 2,
			size,
			size
		)
	end
end

function Button:update(dt)
	if self.win then
		self.vel = self.vel + dt * 100
		self.y = self.y + self.vel * dt
	else
		self.timer = self.timer - dt / self.size
		if self.timer < -1 then
			self.root:callTree('lose')
		end
	end
end

return Button