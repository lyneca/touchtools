Button = {
	rect = Rectangle,
	pressed_settings = {
		color = {200, 200, 200},
		border = 5,
		bordercolor = {200, 200, 200},
	},
	released_settings = {
		color = {255, 255, 255},
		border = 5,
		bordercolor = {255, 255, 255},
	},
	pressed = false,
	toggle = false
}

function Button:new(x, y, w, h, o)
	setmetatable(o, self)
	self.__index = self
	o.rect = Rectangle:new(x, y, w, h)
	return o
end

function Button:release()
	if not self.toggle then
		self.pressed = false
	end
end

function Button:press()
	if self.toggle then
		self.pressed = not self.pressed
	else
		self.pressed = true
	end
end

function Button:update(dt)

end

function Button:touchDown(id, x, y)
	if self.rect:isContained(x, y) then
		self:press()
		touches[id].bound_object = self
	end
end

function Button:touchUp(id, x, y)
	self:release()
end

function Button:draw()
	if self.pressed then settings = self.pressed_settings else settings = self.released_settings end
	if settings.border then
		love.graphics.setColor(settings.bordercolor)
		love.graphics.rectangle(
			'fill',
			self.rect.x - settings.border,
			self.rect.y - settings.border,
			self.rect.w + settings.border * 2,
			self.rect.h + settings.border * 2
		)
	end
	love.graphics.setColor(settings.color)
	love.graphics.rectangle(
		'fill',
		self.rect.x,
		self.rect.y,
		self.rect.w,
		self.rect.h
	)
end
