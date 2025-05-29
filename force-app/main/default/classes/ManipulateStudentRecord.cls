public class ManipulateStudentRecord {
    public Student_Data__c student{get;set;}

    public ManipulateStudentRecord()
    {
        ManipulateStudentRecordHelper st1 = new ManipulateStudentRecordHelper();
        List<ManipulateStudentRecordHelper.testwrapper> stRec = new List<ManipulateStudentRecordHelper.testwrapper>();
    }

    public void save(){
        Student_Data__c studentRec = New Student_Data__c();
        studentRec.Name = student.Name;
        studentRec.Department_Name__c = student.Department_Name__c;
        studentRec.College_Name__c = student.College_Name__c;
        studentRec.D_O_B__c = student.D_O_B__c;
        studentRec.SSLC_Marks__c = student.SSLC_Marks__c;
        studentRec.HSC_Marks__c = student.HSC_Marks__c;
        studentRec.Address__c = student.Address__c;
        studentRec.Email__c = student.Email__c;
        studentRec.Phone_Number__c = student.Phone_Number__c;
        insert studentRec;
    }
}