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
    
<<<<<<< HEAD:CapProject/DBNetwork/loginNetwork.swift
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
=======
>>>>>>> parent of 11c4cd0... commit with appdelegate bug:CapProject/DBNetwork/NetworkConstant.swift
static let currentUserUID = Auth.auth().currentUser?.uid
static let rootRef        = Database.database().reference()
static let studentRef     = Database.database().reference().child("students").child((NetworkConstant.currentUserUID)!)
static let teacherRef     = Database.database().reference().child("teachers").child((NetworkConstant.currentUserUID)!)
static let studentInfoRef = NetworkConstant.studentRef.child("info")
static let teacherInfoRef = NetworkConstant.teacherRef.child("info")
<<<<<<< HEAD:CapProject/DBNetwork/loginNetwork.swift
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
=======
static let postRef = NetworkConstant.rootRef.child(Constants.post)
static let alertPosttRef  = NetworkConstant.postRef.child(Constants.postAlert)
static let AssignmentPostRef = NetworkConstant.postRef.child(Constants.AssigmentPost)
static let generalInfoPostRef = NetworkConstant.postRef.child(Constants.generalInfoPost)
    
    //==> Mark Student update
    
    static func AddStudentinDatabase(withStudent student: Student){
        
        let StudentAtribute = [Constants.firstName: student.firstName, Constants.lastName: student.lastName, Constants.email: student.email,Constants.username:student.username, Constants.uid: NetworkConstant.currentUserUID]
        NetworkConstant.studentInfoRef.setValue(StudentAtribute)
>>>>>>> parent of 11c4cd0... commit with appdelegate bug:CapProject/DBNetwork/NetworkConstant.swift
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
<<<<<<< HEAD:CapProject/DBNetwork/loginNetwork.swift
<<<<<<< HEAD:CapProject/DBNetwork/NetworkConstant.swift
        static func updateFirstName(firstname: String!){
            NetworkConstant.teacherInfoRef.updateChildValues([Constants.firstName: firstname])
        }
        static func updateLastName(lastname: String!){
            NetworkConstant.teacherInfoRef.updateChildValues([Constants.lastName:lastname])
        }
=======
}
    //==> Mark Teacher Update
    
    static func AddTeacherinDatabase(withTeacher teacher: Teacher){
>>>>>>> parent of 11c4cd0... commit with appdelegate bug:CapProject/DBNetwork/NetworkConstant.swift
        
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
<<<<<<< HEAD:CapProject/DBNetwork/loginNetwork.swift
=======
>>>>>>> parent of 955b75c... about to split qr code with vc:CapProject/DBNetwork/loginNetwork.swift
=======
    
    //==> Mark: attendance ref
    
    struct attencace {
        
        static let attendanceRef = Database.database().reference().child(Constants.attendance)
        static let newAttendance = NetworkConstant.attencace.attendanceRef.childByAutoId()
        
    }
>>>>>>> parent of 11c4cd0... commit with appdelegate bug:CapProject/DBNetwork/NetworkConstant.swift
}

