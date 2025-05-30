public with sharing class StudentAdmissionHome{
    public List<SelectOption> collegeList {get;set;}
    public String selectedCollegeName {get;set;}
    public List<SelectOption> departmentList {get;set;}
    public String selectedDepartmentName {get;set;}
    public Boolean showDepartments {get;set;}
    public Student__c student {get;set;}
    public Contact con {get;set;}

    public StudentAdmissionHome()
    {
        collegeList = new List<SelectOption>();
        selectedCollegeName = '';
        departmentList = new List<SelectOption>();
        selectedDepartmentName = '';
        showDepartments = false;
        student = new Student__c();
        con = new Contact();
        getCollegeList();
    }

    public void getCollegeList()
    {
        List<College__c> collegeTempList = [SELECT Name, Id FROM College__c ORDER BY Name ASC];
        if(collegeTempList != null && collegeTempList.size() > 0)
        {
            for(College__c clg : collegeTempList)
            {
                List<SelectOption> options = new List<SelectOption>();
                if(collegeList.isEmpty()){
                    collegeList.add(new SelectOption('', '--None--'));
                }
                if (clg != null && clg.Name != null){
                    collegeList.add(new SelectOption(clg.Name, clg.Name));
                }
            }
        }
    }

    public void getDepartmentList()
    {
        departmentList = new List<SelectOption>();
        showDepartments = false;
        if(String.isNotBlank(selectedCollegeName))
        {
            List<Class__c> tempClassList = [SELECT Id, Name, College__c, College__r.Name FROM Class__c WHERE (College__r.Name != null AND College__r.Name =: selectedCollegeName) ORDER BY Name ASC];

            if(tempClassList != null && tempClassList.size() > 0)
            {
                showDepartments = true;
                for(Class__c cls : tempClassList)
                {
                    List<SelectOption> options = new List<SelectOption>();
                    if(departmentList.isEmpty()){
                        departmentList.add(new SelectOption('', '--None--'));
                    }
                    if (cls != null && cls.Name != null){
                        departmentList.add(new SelectOption(cls.Name, cls.Name));
                    }
                }
            }
        }
    }
}