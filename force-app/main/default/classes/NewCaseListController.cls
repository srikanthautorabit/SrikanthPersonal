public class NewCaseListController {
   public list<case> cases;
    public list<case> getNewCases(){
        cases= [select id,casenumber from case where status='new'];
        return cases;
    }
}