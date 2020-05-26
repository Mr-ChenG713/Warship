public class AdicionarSupplyController {
     public AdicionarSupplyController(ApexPages.StandardController controller) {
        
    } 
    
     public Supply__c Supply{get;set;}
    public String Name {get;set;}
    public Integer Quantidade {get;set;}
    public Integer UnitCost {get;set;}
    
    
    
     public void guardarSupply(){
        Supply__c objSupply = new Supply__c();
        
        objSupply.Name  = Name;
       	objSupply.Quantity__c	 = Quantidade;
        objSupply.Unit_Cost__c = UnitCost;
        
            try{
               
                    insert objSupply;
                    
                    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Supply inserido com sucesso'));
                    Name =null;
                	Quantidade=null;
                	UnitCost = null;
                  
            }catch(DmlException e){
            }
        }


}