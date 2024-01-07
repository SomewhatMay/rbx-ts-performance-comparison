import MainClass from "./MainClass";
import rand from "./rand";

export default function(testCount: number, simulationCount: number) {
    print("Starting benchmark....")

    const totalStart = tick();

    const benchmarkTable: number[] = [];

    const getMiliseconds = (t: number) => {
        return (math.floor(t * 1000 * 100) / 100);
    }

    const runSimulation = () => {
        const start = tick();
        const simulationBreak = .016; // In seconds
        const isPrimeContainer: boolean[] = [];
        const testContainer: MainClass[] = [];

        for (let i = 0; i < simulationCount; i++) {
            const tester = new MainClass(rand.NextInteger(1, i), rand.NextInteger(1, i));
            let isPrime: boolean = tester.isPrime();
            
            for (let j= 0; j < 100; j++) {
                const choice = rand.NextInteger(1, 6);

                if (choice === 1) {
                    tester.increment(rand.NextInteger(1, i));
                } else if (choice === 2) {
                    tester.decrement();
                } else {
                    isPrime = tester.isPrime();
                }
            }

            isPrimeContainer.push(isPrime);
            testContainer.push(tester);
        }

        const diff = tick() - start;
        benchmarkTable.push(diff);
        task.wait(simulationBreak);
    }

    const runTest = () => {
        for (let i = 0; i < testCount; i++) {
            runSimulation();

            print(`Complete: ${math.floor(i / testCount * 100)}%`);
        }
    }

    runTest();

    const totalFinish = tick();
    const difference = totalFinish - totalStart;

    let averageDifference: number = 0;

    benchmarkTable.forEach(duration => {
        averageDifference += duration;
    });

    averageDifference = averageDifference / benchmarkTable.size();

    print("Test results:")
    print(`\tTotal Iterations: ${simulationCount * testCount}`);
    print(`\t Average Difference: ${getMiliseconds(averageDifference)}ms`)
    print(`\tTotal Difference: ${getMiliseconds(difference)}ms`)
}