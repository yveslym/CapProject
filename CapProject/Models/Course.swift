//
//  Course.swift
//  CapProject
//
//  Created by Yves Songolo on 8/8/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
class Course: NSObject{
    
    private var courseName : String?
    private var courseID: String?
    private var courseDescription: String?
    private var teacher: Teacher?
    private var student = [Student]()
    // add course start time and end time
    
    override init (){
        self.courseName = ""
        self.courseID   = ""
        self.courseDescription = ""
       
    }
    func setCourseDescription( withDescription descrition: String){
        self.courseDescription = descrition
    }
    func setCourseName (withName name: String){
        self.courseName = name
    }
    func setCourseID (withID ID: String){
        self.courseID = ID
    }
    
    func setTeacher(withTeacher teacher: Teacher){
        self.teacher = teacher
    }
    func addStudent(withStudent student:Student){
        self.student.append(student)
    }
    
    //==> Mark 'Getter'
    
    func getName()-> String{return self.courseName!}
    
    func getID()->String {return self.courseID!}
    
    func getDescrition()->String{return self.courseDescription!}
    
    func getTeacher()->Teacher{return self.teacher!}
    
    func getStudent(withUID studentUID: String) -> Student{
        
        var studentFind = Student()
        for indexStudent in self.student{
            if indexStudent.uid == studentUID{
                studentFind = indexStudent
            }
        }
    return studentFind
    }
    
}












