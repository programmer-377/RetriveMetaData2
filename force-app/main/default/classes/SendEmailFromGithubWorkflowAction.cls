public with sharing class SendEmailFromGithubWorkflowAction {
    public SendEmailFromGithubWorkflowAction() {

    }

    public void sendEmail(String status){

        if(String.isNotBlank(status)){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new List<String>{UserInfo.getUserEmail()});
            if(status.equalsIgnoreCase('Success')){
                mail.setSubject('Github file synced successfully');
                mail.setPlainTextBody('Hi ' + UserInfo.getFirstName() + ' ' + UserInfo.getLastName() + ',' + '\n' + '\n' + 'Backup to github is successfull' + '\n' + '\n' + 'Thanks.');
            }
            else{
                mail.setSubject('Github file synced is Failed');
                mail.setPlainTextBody('Hi ' + UserInfo.getFirstName() + ' ' + UserInfo.getLastName() + ',' + '\n' + '\n' + 'Backup to github is Failed' + '\n' + '\n' + 'Thanks.');
            }

            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}