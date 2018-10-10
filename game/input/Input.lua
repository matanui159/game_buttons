local Entity = require('Entity')

local Input = Entity:extend()

function Input:callInput(button)
	print(button)
	local root = self
	while root.parent do
		root = root.parent
		print(root)
	end

	print(root)
	root:callTree('input', button)
end

return Input