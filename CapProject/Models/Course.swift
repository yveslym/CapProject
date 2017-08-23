//
//  Course.swift
//  CapProject
//
//  Created by Yves Songolo on 8/8/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import Firebase

class Course: NSObject{
    
    var courseName : String?
    var section : String?
    var courseID: String?
    var Description: String?
    var teacher: Teacher?
    var teacherID = String()
    var student = [Student]()
    var listOfAttendance = [String]()
    var todayAttendance : String?
    var attendance = [Attendance]()
    var schedule : Schedule?
    var courseAdress : String?
    // add course start time and end time
    
    override init (){
        self.courseName = ""
        self.courseID   = ""
        self.Description = ""
        self.section = ""
       
    }
    
    init?(snapshot: DataSnapshot) {
        
        guard let dict = snapshot.value as? [String: Any]
            
            else{return nil}
        let course = dict[Constants.course] as? Course
        self.courseID = course?.courseID
        self.courseName = course?.courseName
        self.Description = course?.Description
        self.todayAttendance = course?.todayAttendance
        self.teacherID = (course?.teacherID)!
        
        
        
    }
    
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













