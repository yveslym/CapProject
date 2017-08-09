//
//  StudentService.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//
//Student

import Foundation
import FirebaseDatabase
import FirebaseAuth.FIRUser
import Firebase
import UIKit

class StudentServices{
    
    
    
    static func createNewStudent(_ firUser: FIRUser, student: Student, password: String, completion: @escaping (Student?) -> Void) {
        
        guard let email   = student.email
            else {return}
        
        Auth.auth().createUser(withEmail: email, password: password, completion: {(students,error) in
            
            if let error = error {
                assertionFailure(error.localizedDescription)
                
                return completion(nil)
            }
            else{
                NetworkConstant.AddStudentinDatabase(withStudent: student)            }
        } )//end of sign up
        
        Student.setCurrent(student, writeToUserDefault: true)
        completion(student)
        
    }
    
    
    static func RetrieveStudentInfo(ForUID uid: String, completion: @escaping (Student?)->Void){
        
        let stringStudent = " studentInfo"
        
        let ref = NetworkConstant.rootRef.child( uid).child(stringStudent)
        
        ref.observeSingleEvent(of: .value, with: {(snapshot) in
            
            guard let student = Student(snapshot: snapshot) else{
                
                return completion(nil)
            }
            
            Student.setCurrent(student: student)
            
            completion(student)
            
        })
    }
    
    static func SignInStudent(email: String!, password: String!)->Bool{
        
        var signinsuccess = false
        
        Auth.auth().signIn(withEmail: email!, password: password!, completion: {(student, error) in
            
            if error == nil{
                print(error.debugDescription)
            }
            else{
                let ref = NetworkConstant.studentInfoRef
                
                ref.observeSingleEvent(of: .value, with: {(snapshot) in
                    
                    guard let student = Student(snapshot: snapshot)
                        
                        else{return}
                    
                    Student.setCurrent(student, writeToUserDefault: true)
                    signinsuccess = true
                    
                })
            }
        })
        
        return signinsuccess
    }
    
    
    
    static func logOutStudent()->Bool{
        
        ////////////////////////////////////////
        //                                   //
        // logout logic need to be add here //
        //                                 //
        ////////////////////////////////////
        
        return true
    }
    
}

































