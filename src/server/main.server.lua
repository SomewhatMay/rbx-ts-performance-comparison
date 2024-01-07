local config = require(script.Parent.config)

-- Allow the renderer and scheduler to settle down
task.wait(3)

if config.language == "ts" then
    print("Testing typescript.")
    local tsTester = require(script.parent.TypescriptTest)
    tsTester.default(config.testCount, config.simulationCount)
else
    print("Testing luau.")
    local luauTester = require(script.Parent.LuauTest)
    luauTester(config.testCount, config.simulationCount)
end