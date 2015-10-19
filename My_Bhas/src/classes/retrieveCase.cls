public class retrieveCase {

    public String getContactName() {
        return 'Babara Levy';
    }

    public List<Case> getCases() {
        return [SELECT Id,status, subject FROM Case
                WHERE Contact.name = 'Babara Levy' AND status = 'New' limit 5];
    }
}