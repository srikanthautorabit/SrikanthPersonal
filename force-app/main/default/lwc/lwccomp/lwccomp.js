import { LightningElement ,track} from 'lwc';

export default class Lwccomp extends LightningElement {
    @track dynamicvalue;

    onchangeevent(event){
        this.dynamicvalue = event.target.value;
    }

}