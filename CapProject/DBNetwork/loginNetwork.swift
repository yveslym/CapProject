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
    
    //==> Mark Student update
    
    static func AddStudentinDatabase(withStudent student: Student){
        
        let StudentAtribute = [Constants.firstName: student.firstName, Constants.lastName: student.lastName, Constants.email: student.email,Constants.username:student.username, Constants.uid: NetworkConstant.currentUserUID]
        NetworkConstant.studentInfoRef.setValue(StudentAtribute)
    }
    
    static func updateStudentNumber(withNumber number: Int){
        NetworkConstant.studentInfoRef.updateChildValues([Constants.phoneNumber:number])
    }
    
    static func updateStudentUsername(withUsername username: String){
        NetworkConstant.studentInfoRef.updateChildValues([Constants.username:username])
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
}

