public with sharing class ControllerPages {
    public ControllerPages(ApexPages.StandardController controller) {
        
    }
    public String Name {get;set;}
    public String Project {get;set;}
    public String WeaponsStatus {get;set;}
    public Date DataFim{get;set;}
    public Integer Milestone{get;set;}
    public Warship__c warship{get;set;}

    
    
    public List<SelectOption> getOpcoesProject(){
        Schema.DescribeFieldResult describeResult = Warship__c.Project_Status__c.getDescribe();
        //Lista as opçoes
        List<Schema.PicklistEntry> entries = describeResult.getPickListValues();
        List<SelectOption> optionToReturn = new List<SelectOption>();
        
        for(Schema.PickListEntry pEntry : entries){
            if(pEntry.isActive()){
                optionToReturn.add(new SelectOption(pEntry.getValue(),pEntry.getLabel()));
            }
        }
        return optionToReturn;
    }
    
    public List<SelectOption> getOpcoesWeaponsStatus(){
        Schema.DescribeFieldResult describeResult = Warship__c.Weapons_Status__c.getDescribe();
        //Lista as opçoes
        List<Schema.PicklistEntry> entries = describeResult.getPickListValues();
        List<SelectOption> optionToReturn = new List<SelectOption>();
        
        for(Schema.PickListEntry pEntry : entries){
            
            if(pEntry.isActive()){
                optionToReturn.add(new SelectOption(pEntry.getValue(),pEntry.getLabel()));
            }
        }
        return optionToReturn;
    }
    
    public void guardarWarship(){
        Warship__c objWarship = new Warship__c();
        objWarship.Name  = Name;
        objWarship.Project_Status__c  = Project;
        objWarship.Weapons_Status__c  = WeaponsStatus;
        objWarship.End_Date__c  = DataFim;
        objWarship.Milestone__c  = Milestone;
        
            try{
                if(objWarship.Project_Status__c != 'Escolha uma opção' && objWarship.Name != null && objWarship.Weapons_Status__c != 'Escolha uma opção'){
                    insert objWarship;
            		
                    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Warship inserido com sucesso'));
                    Name =null;
                    Project =null;
                    WeaponsStatus =null;
                    Milestone = null;
                    DataFim = null;
                    
            }else{
                    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.FATAL,'Preencha todos os campos'));
                }
            }catch(DmlException e){
                
            }
        }
}