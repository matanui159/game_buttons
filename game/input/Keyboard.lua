local Entity = require('Entity')

local Keyboard = Entity:extend()

function Keyboard:setButton(name, key)
	key = key or name
	self.parent.next[name] = love.keyboard.isDown(key)
end

function Keyboard:update()
	self:setButton('left')
	self:setButton('right')
	self:setButton('up')
	self:setButton('down')
	self:setButton('action', 'space')
end

return Keyboard