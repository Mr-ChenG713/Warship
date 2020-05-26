public class VerWarshipPageController {
    
    public List<Case> getLinkID(){
        List<Case> results = Database.query('Select Id,Name from Warship where Status = \'New\'');
        return results;
    }

}