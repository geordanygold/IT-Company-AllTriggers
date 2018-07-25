public  class TotalActiveProjectsHelper {

	public static CountClientsActiveProjects countClActProjes ( List <id> clientsIds ){

		CountClientsActiveProjects myResult = new CountClientsActiveProjects();

			Map <Id, Integer> activeProjects = new Map <Id, Integer>();
			List <Id> clientsWithActiveProjectsIds = new List <Id>();
			List <Client__c> clientsActiveProjes = new List <Client__c>();


			List <AggregateResult> allProjects = [Select Client__c, COUNT(Id)total
								From Project__c
								Where Client__c In : clientsIds
								AND Active__c = true
								GROUP By Client__c];

			For( AggregateResult ag : allProjects ){
				myResult.clientsActiveProjes.add( new Client__c( 
					Id = (id)ag.get('Client__c'), 
					TotalActiveProjects_c__c = (Integer)ag.get('total')
				));
                
                clientsWithActiveProjectsIds.add( (id)ag.get('Client__c') );
			}								


			myResult.clientsWithoutActiveProjects = [Select Id, TotalActiveProjects_c__c
								From Client__c
								Where Id NOT In : clientsWithActiveProjectsIds];

			For( Client__c client : myResult.clientsWithoutActiveProjects ){
				client.TotalActiveProjects_c__c = 0;
			}

			return myResult;
	}

}
