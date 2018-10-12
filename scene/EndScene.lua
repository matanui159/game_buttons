local Entity = require('Entity')

local EndScene = Entity:extend()

function EndScene:new(score, scene)
	self.score = score
	self.scene = {scene}
	self.timer = 0
	self.font = love.graphics.newFont(100)
end

function EndScene:update(dt)
	self.timer = self.timer + dt
	if self.timer >= 2 then
		Entity.root = self.scene[1]
	end
end

function EndScene:draw()
	love.graphics.setFont(self.font)
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.printf(self.score,
		0,
		love.graphics.getHeight() / 2 - 50,
		love.graphics.getWidth(),
		'center'
	)
end

return EndScene