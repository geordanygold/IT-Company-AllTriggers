@isTest
public class TestTotalActiveProjects {
    
    @isTest
    public static void totalActiveInsert(){
        
        Client__c firstClient = ITCompanyDataFactory.oneClient(false, 'Client11');
        insert firstClient;
        
        Project__c firstProject = ITCompanyDataFactory.secProject(false, 'Project1', firstClient.Id, true);
        insert firstProject;
        
        Project__c secondProject = ITCompanyDataFactory.secProject(false, 'Project2', firstClient.Id, false);
        insert secondProject;
        
        Project__c thirdProject = ITCompanyDataFactory.secProject(false, 'Project3', firstClient.Id, true);
        insert thirdProject;
        
		firstClient = [SELECT TotalActiveProjects_c__c FROM Client__c WHERE Id =: firstClient.Id];
		system.assertEquals(2, firstClient.TotalActiveProjects_c__c);        
    }
    
    
    @isTest
    public static void totalActiveUpdate(){
        
        Client__c firstClient = ITCompanyDataFactory.oneClient(false, 'Client11');
        insert firstClient;
        
        Project__c firstProject = ITCompanyDataFactory.secProject(false, 'Project1', firstClient.Id, TRUE);
        insert firstProject;
        
        Project__c secondProject = ITCompanyDataFactory.secProject(false, 'Project2', firstClient.Id, false);
        insert secondProject;
        
        Project__c thirdProject = ITCompanyDataFactory.secProject(false, 'Project3', firstClient.Id, TRUE);
        insert thirdProject;
        

        User u1 = [SELECT Id FROM User WHERE Alias='aloja'];

        Test.startTest();

        System.runAs ( u1 ){
            
            secondProject.Active__c = TRUE;
            update secondProject;
            
            firstClient = [SELECT TotalActiveProjects_c__c FROM Client__c WHERE Id =: firstClient.Id];          
        }        
        Test.stopTest(); 
        system.assertEquals(3, firstClient.TotalActiveProjects_c__c);
    }
    
    
    @isTest
    public static void totalActiveDelete(){
        
        Client__c firstClient = ITCompanyDataFactory.oneClient(false, 'Client11');
        insert firstClient;
        
        Project__c firstProject = ITCompanyDataFactory.secProject(false, 'Project1', firstClient.Id, TRUE);
        insert firstProject;
        
        Project__c secondProject = ITCompanyDataFactory.secProject(false, 'Project2', firstClient.Id, false);
        insert secondProject;
        
        Project__c thirdProject = ITCompanyDataFactory.secProject(false, 'Project3', firstClient.Id, TRUE);
        insert thirdProject;
            
            delete firstProject;
            
            firstClient = [SELECT TotalActiveProjects_c__c FROM Client__c WHERE Id =: firstClient.Id];          

    }

}