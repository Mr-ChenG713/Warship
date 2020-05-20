trigger SupTrigger on Supply__c (after insert, after update) {
    
    for(Supply__c snew : Trigger.new){
        
        if(Trigger.isInsert || snew.Name != Trigger.oldMap.get(snew.Id).Name){
            
            for(Supply__c existing : [SELECT Id, Name FROM Supply__c where Id != :snew.Id]){
                
                if(existing.Name == snew.Name) snew.addError ('O Supply\n"' +snew.Name+ '"\njá existe !!!');
            }
        }
    }

}