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
    
<<<<<<< HEAD:CapProject/DBNetwork/NetworkConstant.swift
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
=======
static let currentUserUID = Auth.auth().currentUser?.uid
static let rootRef        = Database.database().reference()
static let studentRef     = Database.database().reference().child("students").child((NetworkConstant.currentUserUID)!)
static let teacherRef     = Database.database().reference().child("teachers").child((NetworkConstant.currentUserUID)!)
static let studentInfoRef = NetworkConstant.studentRef.child("info")
static let teacherInfoRef = NetworkConstant.teacherRef.child("info")
>>>>>>> parent of 955b75c... about to split qr code with vc:CapProject/DBNetwork/loginNetwork.swift
    
    //==> Mark Student update
    
    
<<<<<<< HEAD:CapProject/DBNetwork/NetworkConstant.swift
    struct Student{
        
        static func UpdatephoneNumber(withNumber number: Int){
            NetworkConstant.studentInfoRef.updateChildValues([Constants.phoneNumber:number])
        }
        
        static func UpdateUsername(withUsername username: String){
            NetworkConstant.studentInfoRef.updateChildValues([Constants.username:username])
        }
        
        static func UpdateFirstName(firstName: String!){
            NetworkConstant.studentInfoRef.updateChildValues([Constants.firstName: firstName])
        }
        
        static func UpdateLastName(lastName: String!){
            NetworkConstant.studentInfoRef.updateChildValues([Constants.lastName: lastName])
        }
        
        static func UpdateLevel(level: String!){
            NetworkConstant.studentInfoRef.updateChildValues([Constants.level: level])
        }
=======
    static func updateStudentNumber(withNumber number: Int){
        NetworkConstant.studentInfoRef.updateChildValues([Constants.phoneNumber:number])
    }
    
    static func updateStudentUsername(withUsername username: String){
        NetworkConstant.studentInfoRef.updateChildValues([Constants.username:username])
>>>>>>> parent of 955b75c... about to split qr code with vc:CapProject/DBNetwork/loginNetwork.swift
    }
    
    //==> Mark Teacher Update
    struct Teacher {
        
    
    
   // static func AddTeacherinDatabase(withTeacher teacher: Teacher){
        
//        let Attrs = [Constants.firstName: teacher.firstName,Constants.lastName: teacher.lastName, Constants.email: teacher.email, Constants.uid:NetworkConstant.currentUserUID]
//        NetworkConstant.teacherInfoRef.setValue(Attrs)
//    }
    
    static func updateUsername(withUsername username: String){
        NetworkConstant.teacherInfoRef.updateChildValues([Constants.username:username])
    }
    
    static func updateNumber(withNumber number: Int){
        NetworkConstant.teacherInfoRef.updateChildValues([Constants.phoneNumber:number])
    }
<<<<<<< HEAD:CapProject/DBNetwork/NetworkConstant.swift
        static func updateFirstName(firstname: String!){
            NetworkConstant.teacherInfoRef.updateChildValues([Constants.firstName: firstname])
        }
        static func updateLastName(lastname: String!){
            NetworkConstant.teacherInfoRef.updateChildValues([Constants.lastName:lastname])
        }
        
    }
    
    //==> Mark: course ref
    
    struct course {
        static let courseRef = Database.database().reference().child(Constants.course)
        
        
    }
    
    
    //==> Mark: attendance ref
    
    struct attencace {
        //returnning an existing attendance path
        static func attendanceRef (withCourseKey key:String, AttendanceKey: String)->DatabaseReference{
            
            return NetworkConstant.course.courseRef.child(key).child(Constants.attendance).child(AttendanceKey)
        }
        
        static func newAttendance (withCourseKey courseKey:String)->DatabaseReference?{
            let ref = NetworkConstant.course.courseRef.child(courseKey)
            if !(ref.key.isEmpty){
                ref.child(Constants.attendance).childByAutoId()
                print ("new atendance added")
            }
            return ref
        }
    }
=======
>>>>>>> parent of 955b75c... about to split qr code with vc:CapProject/DBNetwork/loginNetwork.swift
}

