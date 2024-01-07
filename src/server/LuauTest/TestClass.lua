local TestClass = {}
TestClass.__index = TestClass


function TestClass:increment(count: number)
	count = count or 1
	self.counter += count
end


function TestClass:isPrime()
	for i=2, math.ceil(self.counter / 2), 1 do
		if (self.counter % i == 0)  then
			return false
		end
	end
	
	return true
end


function TestClass.new(counter)
	local self = setmetatable({
		counter = counter;
	}, TestClass)
	
	return self
end


return TestClass