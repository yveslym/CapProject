//
//  CourseServices.swift
//  CapProject
//
//  Created by Yves Songolo on 8/15/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation

class CourseServices{
    
    func retrieveCourseInfo(){
        
    }
    
    
    static func create(withCoourse course: Course, completion: @escaping (Bool?)->Void){
        
        var completed = false
        
       
        
        let ref = NetworkConstant.course.courseRef.childByAutoId()//
        
        course.courseID = ref.key as String
        ref.child(Constants.courseInfo)
        
         let atts = [Constants.name: course.courseName, Constants.section : course.section,Constants.courseID : course.courseID, Constants.description : course.Description, Constants.teachers: course.teacherID]
        
        ref.setValue(atts)
        
        var list = ["":""]
        var index = 0
        // add the attendance in the the detabase
        for attendancelist in course.listOfAttendance{
            

            list = ["Attendance day \(index+1)": attendancelist]
            ref.child(Constants.attendance).setValue(list)
            completed = true
            completion(completed)
        }
    }
    static func createAttendance (withCourse course: Course, completion: @escaping (String?)->Void){
        
        let courseID = course.courseID
       

        let AttendanceRef = NetworkConstant.course.newAttendance(withCourseKey: courseID!)// create new attendance
       
        
        if AttendanceRef?.key != nil
       {
        let key = String(describing: AttendanceRef?.key)   // get the key
        print("the key of new attendance is\(key)")
        let newAttendance = Attendance()
        newAttendance.AttendanceID = key // pass the key to new attendance
        course.listOfAttendance.append(key)
        course.attendance.append(newAttendance)
        
        AttendanceRef?.setValue(["AttendanceID":key])
        // also add date on the attendance JSOn
        
        print ("attendance created")
        completion(key)
        
        }
       else{
        print ("Couldn't create attendance")
        }
    }
}
































