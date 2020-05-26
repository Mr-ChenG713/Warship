trigger wrTrigger on WarshipResource__c (before insert) {
    
    Set<Id> setWarshipId = new Set<Id>();
    Set<Id> setResourcepId = new Set<Id>();
    Set<Id> setWarshipResource = new Set<Id>();
    
    for (WarshipResource__c wrNew : Trigger.New)     
    {    
        setWarshipId.add(wrNew.Warship__c);
        setResourcepId.add(wrNew.Resource__c);
    }
    
    for (WarshipResource__c wrNew :[SELECT Id, Warship__c, Resource__c FROM WarshipResource__c WHERE Warship__c IN: setWarshipId AND
                                   Resource__c IN :setResourcepId])     
    {    
        setWarshipResource.add(wrNew.Warship__c);
        setWarshipResource.add(wrNew.Resource__c);
    }
    
    for (WarshipResource__c wrNew : Trigger.New)     
    {    
        if((!setWarshipResource.contains(wrNew.Warship__c)) && (!setWarshipResource.contains(wrNew.Resource__c))) continue;
        
        wrNew.addError('O warship já tem relação com este Resource');
    }
}