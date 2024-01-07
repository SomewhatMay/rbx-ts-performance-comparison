return function()
	print("Starting benchmark...")

	local totalStart = tick()
	local testCount = 20
	local simulationCount = 5_000

	local MainClass = require(script.MainClass)
	local rand = require(script.rand)

	local benchmarkTable = {}

	local function getMiliseconds(t: number)
		return math.floor(t * 1000 * 100) / 100
	end

	local function runSimulation()
		local start = tick()
		local simulationBreak = 0.016
		local isPrimeContainer = {}
		local testContainer = {}
		
		for i=0, (simulationCount-1), 1 do
			local tester = MainClass.new(rand:NextInteger(1, i), rand:NextInteger(1, i))
			local isPrime = tester:isPrime()
			
			for _=1, 100, 1 do
				local choice = rand:NextInteger(1, 6)
				
				if choice == 1 then
					tester:increment(rand:NextInteger(1, i))
				elseif choice == 2 then
					tester:decrement()
				else
					isPrime = tester:isPrime()
				end
			end
			
			table.insert(isPrimeContainer, isPrime)
			table.insert(testContainer, tester)
		end
		
		local diff = tick() - start
		table.insert(benchmarkTable, diff)
		task.wait(simulationBreak)
	end

	local function runTest()
		for i=1, testCount, 1 do
			runSimulation()
			
			print(`Complete: {math.floor(i / testCount * 100)}%`)
		end
	end

	runTest()

	local totalFinish = tick()
	local difference = totalFinish - totalStart

	local averageDifference = 0

	for _, duration in pairs(benchmarkTable) do
		averageDifference += duration
	end

	averageDifference = averageDifference / #benchmarkTable

	print("Test results:")
	print(`\tTotal Iterations: {simulationCount * testCount}`)
	print(`\t Average Difference: {getMiliseconds(averageDifference)}ms`)
	print(`\tTotal Difference: {getMiliseconds(difference)}ms`)
end