import TestClass from "./TestClass";

export default class MainClass extends TestClass {
    public constructor( private decrementCount: number, counter: number) {
        super(counter);
    }

    public decrement() {
        this.counter -= this.decrementCount;
    }
}