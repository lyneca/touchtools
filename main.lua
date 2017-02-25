require 'rectangle'
require 'button'
objects = {}
touches = {}
function love.load()
	love.window.setTitle("Touch Controls Version 0.1.0b0")
	objects = {
		Button:new(10, 10, 100, 100,
			{
				pressed_settings = {
					color = {30, 30, 30},
					border = 5,
					bordercolor = {20, 20, 20},
				},
				released_settings = {
					color = {50, 50, 50},
					border = 5,
					bordercolor = {20, 20, 20},
				}
			}
		),
		Button:new(125, 10, 100, 100,
			{
				pressed_settings = {
					color = {30, 30, 30},
					border = 5,
					bordercolor = {20, 20, 20},
				},
				released_settings = {
					color = {50, 50, 50},
					border = 5,
					bordercolor = {20, 20, 20},
				},
				toggle = true
			}
		),
	} 
end

function love.update(dt)
	for k, object in ipairs(objects) do
		object:update(context)
	end
end

function love.draw()
	for k, object in ipairs(objects) do
		object:draw()
	end
end

function love.touchpressed(id, x, y)
	touches[id] = {
		x = x,
		y = y
	}
	for k, object in ipairs(objects) do
		object:touchDown(id, x, y)
	end
end

function love.touchreleased(id, x, y)
	if touches[id] and touches[id].bound_object then
		touches[id].bound_object:touchUp(id, x, y)
	end
end
