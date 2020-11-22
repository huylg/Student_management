class Student {
     String firstName;
     String lastName;
     String dateOfBirth;
     String gender;
     String className;
     String otherInfo;
	 String avatarPath;

     int id;
     bool isDisable;

    Student(String firstName, String lastName, String dateOfBirth, String gender, String className,String otherInfo,int id,bool isDisable, String avatarPath){
       this.firstName = firstName; 
       this.lastName = lastName;
       this.dateOfBirth = dateOfBirth;
       this.gender = gender;
       this.className = className;
       this.otherInfo = otherInfo;
       this.isDisable = isDisable;
       this.id = id;
	   this.avatarPath = avatarPath;
    }

    static Student studentDefault(){
        return Student('','','2000-01-01','male','','',null,false,'');
    }
    
    Student clone(){
        return Student(
                this.firstName,
                this.lastName,
                this.dateOfBirth,
                this.gender,
                this.className,
                this.otherInfo,
                this.id,
                this.isDisable,
				this.avatarPath,
        );
    }

    
}
