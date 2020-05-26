trigger wsTrigger on WarshipSupply__c (before insert) {
    
    Set<Id> setWarshipId = new Set<Id>();
    Set<Id> setSupplyId = new Set<Id>();
    Set<Id> setWarshipSupply = new Set<Id>();
    
    for (WarshipSupply__c wsNew : Trigger.New)     
    {    
        setWarshipId.add(wsNew.Warship__c);
        setSupplyId.add(wsNew.Supply__c);
    }
    
    for (WarshipSupply__c wsNew :[SELECT Id, Warship__c, Supply__c FROM WarshipSupply__c WHERE Warship__c IN: setWarshipId AND
                                   Supply__c IN :setSupplyId])     
    {    
        setWarshipSupply.add(wsNew.Warship__c);
        setWarshipSupply.add(wsNew.Supply__c);
    }
    
    for (WarshipSupply__c wsNew : Trigger.New)     
    {    
        if((!setWarshipSupply.contains(wsNew.Warship__c)) && (!setWarshipSupply.contains(wsNew.Supply__c))) continue;
        
        wsNew.addError('O warship já tem relação com este Supply');
    }
}