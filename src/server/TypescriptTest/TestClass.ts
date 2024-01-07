export default class TestClass {
    public constructor( public counter: number ) { }

    
    public increment(count: number = 1) {
        this.counter += count;
    }


    public isPrime() {
        for (let i = 2; i <= math.ceil(this.counter/2); i++) {
            if (this.counter % i === 0) {
                return false;
            }
        }
        
        return true;
    }
}