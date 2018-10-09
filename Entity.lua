local Object = require('Object')

local Entity = Object:extend()

function Entity:call(name, ...)
	local func = self[name]
	if type(func) == 'function' then
		func(self, ...)
	end
end

function Entity:callTree(name, ...)
	self:call(name, ...)
	for key, child in pairs(self) do
		if key ~= 'parent' and Object.is(child, Entity) then
			if not child.skip then
				child.parent = self
				child:callTree(name, ...)
				child.parent = nil
			end
			child.skip = nil
		end
	end
	self:call(name .. 'End', ...)
end

return Entity