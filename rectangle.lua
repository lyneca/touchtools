Rectangle = {}

function Rectangle:new(x, y, w, h)
	o = {}
	setmetatable(o, self)
	self.__index = self
	o.x = x
	o.y = y
	o.w = w
	o.h = h
	return o
end

function Rectangle:isContained(x, y)
	if self.x < x and x < self.x + self.w and self.y < y and y < self.y + self.h then
		return true
	else
		return false
	end
end