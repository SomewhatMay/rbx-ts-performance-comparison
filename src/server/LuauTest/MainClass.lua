
local super = require(script.Parent.TestClass)
local MainClass = setmetatable({}, super)
MainClass.__index = MainClass


function MainClass:decrement()
	self.counter -= self.decrementCount
end


function MainClass.new(decrementCount: number, counter: number)
	local self = setmetatable(super.new(counter), MainClass)
	
	self.decrementCount = decrementCount
	
	return self
end


return MainClass