trigger WarTrigger on Warship__c (before insert, before update) {
    
    if(Trigger.isBefore){
        
        for(Warship__c wnew : Trigger.new){
            
            for(Warship__c existing : [SELECT Id, Name FROM Warship__c where Id != :wnew.Id]){
                
                if(Trigger.isInsert){
                    
                    if(existing.Name == wnew.Name) wnew.addError ('O Warship\n"' +wnew.Name+ '"\njá existe !!!');
                	if (wnew.Project_Status__c != 'Planning') wnew.addError ('O Project Statu inicial é Planning');
                    if (wnew.Milestone__c <= 0) wnew.addError ('Maior que 0');
                }else if (Trigger.isUpdate){
                    
                    if(existing.Name == wnew.Name) wnew.addError ('O Warship\n"' +wnew.Name+ '"\njá existe !!!');
                    if (wnew.Milestone__c < 0) wnew.addError ('Maior que 0');
                	if (wnew.Milestone__c == 0) wnew.Project_Status__c = 'Green';
                    if (wnew.Milestone__c == 1) wnew.Project_Status__c = 'Yellow';
                    if (wnew.Milestone__c >= 2) wnew.Project_Status__c = 'Red';
                    if (wnew.Milestone__c == 0 && wnew.Weapons_Status__c == 'Fully Operational') wnew.Project_Status__c = 'Completed';
                }
            }
        }
    }
}