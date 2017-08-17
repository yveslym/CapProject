//
//  loginNetwork.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseAuth.FIRUser
import Firebase
import UIKit

struct NetworkConstant
{
    
static let currentUserUID = Auth.auth().currentUser?.uid
static let rootRef        = Database.database().reference()
static let studentRef     = Database.database().reference().child("students").child((NetworkConstant.currentUserUID)!)
static let teacherRef     = Database.database().reference().child("teachers").child((NetworkConstant.currentUserUID)!)
static let studentInfoRef = NetworkConstant.studentRef.child("info")
static let teacherInfoRef = NetworkConstant.teacherRef.child("info")
static let postRef = NetworkConstant.rootRef.child(Constants.post)
static let alertPosttRef  = NetworkConstant.postRef.child(Constants.postAlert)
static let AssignmentPostRef = NetworkConstant.postRef.child(Constants.AssigmentPost)
static let generalInfoPostRef = NetworkConstant.postRef.child(Constants.generalInfoPost)
    
    //==> Mark Student update
    
    static func AddStudentinDatabase(withStudent student: Student){
        
        let StudentAtribute = [Constants.firstName: student.firstName, Constants.lastName: student.lastName, Constants.email: student.email,Constants.username:student.username, Constants.uid: NetworkConstant.currentUserUID]
        NetworkConstant.studentInfoRef.setValue(StudentAtribute)
    }
    
    struct updateStudentInfo{
        
    static func phoneNumber(withNumber number: Int){
        NetworkConstant.studentInfoRef.updateChildValues([Constants.phoneNumber:number])
    }
    
    static func Username(withUsername username: String){
        NetworkConstant.studentInfoRef.updateChildValues([Constants.username:username])
    }
    
    static func FirstName(firstName: String!){
        NetworkConstant.studentInfoRef.updateChildValues([Constants.firstName: firstName])
    }
    
    static func LastName(lastName: String!){
        NetworkConstant.studentInfoRef.updateChildValues([Constants.lastName: lastName])
    }
    
    static func Level(level: String!){
        NetworkConstant.studentInfoRef.updateChildValues([Constants.level: level])
    }
}
    //==> Mark Teacher Update
    
    static func AddTeacherinDatabase(withTeacher teacher: Teacher){
        
        let Attrs = [Constants.firstName: teacher.firstName,Constants.lastName: teacher.lastName, Constants.email: teacher.email, Constants.uid:NetworkConstant.currentUserUID]
            NetworkConstant.teacherInfoRef.setValue(Attrs)
    }
    
    static func updateTeacherUsername(withUsername username: String){
        NetworkConstant.teacherInfoRef.updateChildValues([Constants.username:username])
    }
    
    static func updateTeacherNumber(withNumber number: Int){
        NetworkConstant.teacherInfoRef.updateChildValues([Constants.phoneNumber:number])
    }

    //==> Mark: course ref
    
    struct course {
        static let courseRef = Database.database().reference().child(Constants.course)
        
        //returnning an existing attendance path
        static func attendanceRef (withCourseKey key:String, AttendanceKey: String)->DatabaseReference{
            
            return NetworkConstant.course.courseRef.child(key).child(Constants.attendance).child(AttendanceKey)
        }
        static func newAttendance (withCourseKey courseKey:String)->DatabaseReference?{
            let ref = NetworkConstant.course.courseRef.child(courseKey)//
            if !(ref.key.isEmpty){
                ref.child(Constants.attendance).childByAutoId()
            }
            
            return ref
          //  (!ref.key.isEmpty) ? return ref : return nil
        }
    }
    
    //==> Mark: attendance ref
    
    struct attencace {
        
        static let attendanceRef = Database.database().reference().child(Constants.attendance)
        static let newAttendance = NetworkConstant.attencace.attendanceRef.childByAutoId()
        
    }
}

