@RestResource(urlmapping='/studentinfo/*')
global class GetStudentInformation
{
    global class studentInfo
    {
        public String studentName{get;set;}
        public String phone{get;set;}
        public String address{get;set;}
        public String departmentName{get;set;}
        public String collegeName{get;set;}
    }

    @httpGet
    global static studentInfo getStudent()
    {
        studentInfo student = new studentInfo();
        RestRequest request = RestContext.request;
        System.debug('request.requestURI ' + request.requestURI);
        String studentId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        System.debug('studentId ' + studentId);

        if(String.isNotBlank(studentId))
        {
            Student__c studentRec = [SELECT Id, Name, Contact_Number__c, Address__c, Class__r.Name, College__r.Name FROM Student__c WHERE Id =: studentId LIMIT 1];
            student.studentName = studentRec.Name;
            student.phone = studentRec.Contact_Number__c;
            student.address = studentRec.Address__c;
            student.departmentName = studentRec.Class__r.Name;
            student.collegeName = studentRec.College__r.Name;
        }

        return student;
    }
}