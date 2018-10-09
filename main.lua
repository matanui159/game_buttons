local GameScene = require('scene.GameScene')
local Entity = require('Entity')

local scene

function love.load()
	scene = GameScene(3)
end

function love.update(dt)
	scene:callTree('update', dt)
end

function love.draw()
	scene:callTree('draw')
end