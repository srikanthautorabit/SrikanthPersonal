@isTest public class stacktest {
    public static testmethod string getEnvironment(){
    	Stack s = new Stack();
			s.push(10.0);
			s.push(5.0);
			s.push('+');

			while (!s.isEmpty()) {
    				Object o = s.pop();

    				if (String.valueOf(o) == '+') {
       					 Double d1 = Double.valueOf(s.pop());
       					 Double d2 = Double.valueOf(s.pop());
       					 Double result = d1 + d2;
       					 System.Debug(d1 + ' + ' + d2 + ' = ' + result);
    				} 
				}
        return null;
	}
}