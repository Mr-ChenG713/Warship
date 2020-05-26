public class ResourcePageController {
    
    public ResourcePageController(ApexPages.StandardController controller) {
        
    } 

  public Resource__c Resource{get;set;}
    public String Name {get;set;}
    public Integer Quantidade {get;set;}
    public Integer Utilizacao {get;set;}
    
    
    public void guardarResource(){
        Resource__c objResource = new Resource__c();
        
        objResource.Name  = Name;
       	objResource.Quantity__c	 = Quantidade;
        objResource.Utilization__c = Utilizacao;
        
            try{
               
                    insert objResource;
                    
            		 
                    
                    ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Resource inserido com sucesso'));
                    Name =null;
                	Quantidade=null;
                	Utilizacao = null;
                  
            }catch(DmlException e){
                
            }
        }

}