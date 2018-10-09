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
	for _, child in pairs(self) do
		if Object.is(child, Entity) then
			if child._skip then
				child._skip = nil
			else
				child:callTree(name, ...)
			end
		end
	end
	self:call(name .. 'End', ...)
end

function Entity:callSkip()
	self._skip = true
end

return Entity