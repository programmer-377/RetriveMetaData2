trigger GenerateCaseNumber on Case (before insert)
{
    if(Trigger.isBefore)
    {
        Integer numberOfCaseRec = [SELECT COUNT() FROM Case] + [SELECT COUNT() FROM Case WHERE IsDeleted = TRUE];

        String defaultNumFieldVal = '00000000';
        String uniqueCaseNumber = String.valueOf(numberOfCaseRec + 1);

        String removeEndOfDefaultNumField = '';
        for(Integer i = 0; i< uniqueCaseNumber.length(); i++)
        {
            removeEndOfDefaultNumField += '0';
        }

        defaultNumFieldVal = defaultNumFieldVal.removeEnd(removeEndOfDefaultNumField);
        defaultNumFieldVal += uniqueCaseNumber;

        System.debug('defaultNumFieldVal ' + defaultNumFieldVal);

        List<Case> templst = new List<Case>();
        for(Case cs : Trigger.new)
        {
            cs.Case_Number_Unique__c = Integer.valueOf(defaultNumFieldVal);
            templst.add(cs);
        }

        insert templst;
    }
}