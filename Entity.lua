local function object(parent)
	local obj = {}
	obj.__index = parent
	return setmetatable(obj, obj)
end

local Entity = object()
Entity._entity = true

function Entity:__call(...)
	local obj = object(self)
	obj:call('new', ...)
	return obj
end

function Entity:extend()
	local cls = object(self)
	cls.__call = self.__call
	return cls
end

function Entity:call(name, ...)
	local func = self[name]
	if type(func) == 'function' then
		func(self, ...)
	end
end

function Entity:callTree(name, ...)
	self:call(name, ...)
	for key, child in pairs(self) do
		if key ~= 'parent' and key ~= '__index' then
			if type(child) == 'table' and child._entity then
				if not child.skip then
					child.parent = self
					child:callTree(name, ...)
					child.parent = nil
				end
				child.skip = nil
			end
		end
	end
	self:call(name .. 'End', ...)
end

return Entity