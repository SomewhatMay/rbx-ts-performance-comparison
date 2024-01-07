local testing: "ts" | "luau" = "luau"

-- Allow the renderer and scheduler to settle down
task.wait(3)

if testing == "ts" then
    print("Testing typescript.")
    local tsTester = require(script.parent.TypescriptTest)
    tsTester.default()
else
    print("Testing luau.")
    local luauTester = require(script.Parent.LuauTest)
    luauTester()
end