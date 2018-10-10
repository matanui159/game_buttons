local GameScene = require('scene.GameScene')
local Entity = require('Entity')

function love.load()
	Entity.root = GameScene(3)
end

function love.keypressed(key)
	Entity.root:callTree('key', key)
end

function love.update(dt)
	Entity.root:callTree('update', dt)
end

function love.draw()
	Entity.root:callTree('draw')
end