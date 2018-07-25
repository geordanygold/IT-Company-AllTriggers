@isTest
public class TestUtilsCreateString {
    
    @isTest
    public static void createString(){
        
        Client__c firstClient = new Client__c( 
        Name = 'Client1',
            Email__c = 'test@gmail.com',
            Budget__c = 1800
        );
        insert firstClient;
        
        List <String> fields = new List <String>{'Name', 'Email__c', 'Budget__c'};
            
        String fieldsValues = UtillsCreateString.populateKey(firstClient, fields, '***');
        system.assertEquals('Client1***test@gmail.com***1800', fieldsValues);
        
        
    }

}
