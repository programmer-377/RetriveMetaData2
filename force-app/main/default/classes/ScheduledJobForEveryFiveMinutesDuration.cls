public with sharing class ScheduledJobForEveryFiveMinutesDuration implements Schedulable {
    public void execute(SchedulableContext ctx) {
        System.debug('Test Scheduled job for Every 5 Minutes Duration');
    }
}