local Entity = require('Entity')

local Input = Entity:extend()

function Input:callButton(button)
	debug.debug()
	self.parent:callTree('button', button)
end

return Input