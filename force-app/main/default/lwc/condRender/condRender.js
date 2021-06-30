import { LightningElement ,track} from 'lwc';

export default class CondRender extends LightningElement {

    @track displayDiv ;
    @track displayCities;
    @track citylist1= ['agra','delhi','pune','mumbai'];
    @track citylist2 = ['chennai','hyd','banglore','kerala'];

    showDivHandler(event){
        this.displayDiv = event.target.checked;
    }
    showNorthCities(event){
        this.displayCities = event.target.checked;
    }
}