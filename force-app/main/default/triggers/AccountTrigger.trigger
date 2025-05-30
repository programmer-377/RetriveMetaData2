trigger AccountTrigger on Account (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    updatetrigger(trigger.IsBefore, trigger.IsAfter, trigger.IsInsert, trigger.IsUpdate, trigger.new, trigger.old);
    public void updatetrigger(Boolean IsBefore, Boolean IsAfter, Boolean IsInsert, Boolean IsUpdate,List<Account> newlist, List<Account> oldlist){
        if(IsBefore && IsInsert || IsBefore && IsUpdate){
            
            for(Account ac: newlist){
                if(ac.Rating != null && ac.Rating.equals('Hot')){
                    ac.AnnualRevenue=10000;
                }else if(ac.Rating != null && ac.Rating.equals('Warm')){
                    ac.AnnualRevenue=5000;
                }else if(ac.Rating != null && ac.Rating.equals('Cold')){
                    ac.AnnualRevenue=1000;
                }
            }
        }
    }
    
    if(trigger.IsInsert){
    System.debug('Trigger Called ======================>' + Trigger.New.size());
    System.debug('Trigger Called ======================>');
    }
}