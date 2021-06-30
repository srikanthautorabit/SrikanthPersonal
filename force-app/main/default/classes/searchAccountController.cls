public with sharing class searchAccountController {
 
 @AuraEnabled
 public static List<account> fetchAccount(String searchKeyWord,string phone, string street,string city,string state,string postal,string country) {
  String searchKey = searchKeyWord + '%';
     String PhoneNo = phone;
     String streetNo = street;
     String cityName = city;
     String stateName = state;
     String postalcode = postal;
     String countryName = country;
     string Accountlist ='select id, Name, Type, Industry, Phone, Fax,Account.BillingStreet from account where Name LIKE: searchKey';
  List < Account > returnList = new List < Account > ();
  /*List < Account > lstOfAccount = [select id, Name, Type, Industry, Phone, Fax,Account.BillingStreet from account
                                   where Name LIKE: searchKey AND (Phone =:PhoneNo AND Account.BillingStreet=:streetNo) LIMIT 500];
 */
     if(PhoneNo != null){
         Accountlist += ' AND Phone LIKE: PhoneNo';
         }
     if(streetNo !=null){
         Accountlist += ' AND BillingStreet LIKE: streetNo';
         
     }
     
     if(cityName !=null){
         Accountlist += ' AND BillingCity LIKE: cityName';
         
     }
     
     if(stateName !=null){
         Accountlist += ' AND BillingState LIKE: stateName';
         
     }
     
     if(postalcode !=null){
         Accountlist += ' AND BillingPostalCode LIKE: postalcode';
         
     }
     
      if(countryName !=null){
         Accountlist += ' AND BillingCountry LIKE: countryName';
         
     }
    List < Account > lstOfAccount = Database.query(Accountlist);
  for (Account acc: lstOfAccount) {
   returnList.add(acc);
  }
  return returnList;
 }
}