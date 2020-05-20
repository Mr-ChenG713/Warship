trigger ResTrigger on Resource__c (after insert, after update) {

    for(Resource__c rnew : Trigger.new){
        
        if(Trigger.isInsert || rnew.Name != Trigger.oldMap.get(rnew.Id).Name){
            
            for(Resource__c existing : [SELECT Id, Name FROM Resource__c where Id != :rnew.Id]){
                
                if(existing.Name == rnew.Name) rnew.addError ('O Resource\n"' +rnew.Name+ '"\njá existe !!!');
            }
        }
    }
}