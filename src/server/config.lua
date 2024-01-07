return {

    -- The number of times the stress test should be carried out
    -- After each iteration, there will be some breathing time (0.016 seconds)
    testCount =  20;

    -- The number of times the main (stress test) simulation will be carried out.
    -- If the number is too high, the script may surpass the max execution time allowed.
    simulationCount = 10_000;

    -- The language to test.
    -- Can be "ts" or "luau".
    language = "luau";
}