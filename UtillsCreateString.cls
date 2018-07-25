public class UtillsCreateString {
    
    public static String populateKey( sObject record, List<String> recordFields, String separator){
        
        String result;
        
        if( !recordFields.isEmpty() && separator != null ){
                    
            List <String> values = new List <String>();
            
            FOR( String sobj : recordFields ){
                
                String item = String.valueOf(record.get(sobj));
                values.add(item);
            }
            result = String.join(values, separator); 
        }
        return result;
    }   
//String description = (String)acc.get(Schema.Account.Description);
//String sInteger = String.valueOf(myInteger);
//String item = String.valueOf(record.get(Schema.sObject.sobj));

}