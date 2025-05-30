public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> lstOfLeads = [SELECT Id, Name, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        for(Lead lead : lstOfLeads){
            lead.LeadSource = 'Dreamforce';
        }
        update lstOfLeads;
    }
}