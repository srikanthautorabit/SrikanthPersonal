import { LightningElement, track} from 'lwc';

export default class SimpleCalculator extends LightningElement {

    @track firstvalue ;
    @track seocondvalue;
    @track result;

    firstvalueset(event){
        this.firstvalue = event.target.value;
    }
    secondvalueset(event){
        this.secondvalue = event.target.value;
    }
    add(event){
      this.result = this.add(this.firstvalue+this.secondvalue)
    }
}