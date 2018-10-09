local Entity = require('Entity')
local Keyboard = require('game.input.Keyboard')

local Input = Entity:extend()

function Input:new()
end

function Input:updateKey(key)
	
end

function Input:updateKeyTree(...)
	self:callTree('updateKey', ...)
end

function Input:update()
	self:updateKeyTree()
end

return Input