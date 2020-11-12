class Student {
     String firstName;
     String lastName;
     String dateOfBirth;
     String gender;
     String className;
     String otherInfo;

     int id;
     bool isDisable;

    Student(String firstName, String lastName, String dateOfBirth, String gender, String className,String otherInfo,int id,bool isDisable){
       this.firstName = firstName; 
       this.lastName = lastName;
       this.dateOfBirth = dateOfBirth;
       this.gender = gender;
       this.className = className;
       this.otherInfo = otherInfo;
       this.isDisable = isDisable;
       this.id = id;
    }

    static Student studentDefault(){
        return Student('','','2000-01-01','male','','',null,false);
    }


    
}
