trigger WarTrigger on Warship__c (after insert, after update) {
    
    for(Warship__c wnew : Trigger.new){
        
        if(Trigger.isInsert || wnew.Name != Trigger.oldMap.get(wnew.Id).Name){
            
            for(Warship__c existing : [SELECT Id, Name FROM Warship__c where Id != :wnew.Id]){
                
                if(existing.Name == wnew.Name) wnew.addError ('O Warship\n"' +wnew.Name+ '"\njá existe !!!');
            }
        }
    }
}