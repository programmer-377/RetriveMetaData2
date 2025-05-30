public with sharing class StudentsDataViewCTRL
{
    public List<StudentWrapper> studentList {get;set;}

    public StudentsDataViewCTRL()
    {
        studentList = new List<StudentWrapper>();
    }

    public class StudentWrapper
    {
        Contact con;
        Student__c std;
        College__c clg;
        Department__c dept;
        String studentName;
        String deptName;
        String clgName;
        String dob;
        String age;
        String sslcMarks;
        String hscMarks;
        String address;
        String email;
        String phone;

        StudentWrapper(Contact c)
        {

        }
    }

    public SObject getStudentRelatedRecords(SObject sobj)
    {
        String sObjName = sobj.Id.getSobjectType().getDescribe().getName();

        switch on (sObjName)
        {
            when 'Contact'
            {

            }
            when 'Student__c'
            {

            }
            when 'College__c'
            {

            }
            when 'Department__c'
            {

            }
        }

        return null;
    }
}