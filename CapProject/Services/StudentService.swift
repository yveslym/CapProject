//
//  StudentService.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//
//Student

import Foundation
import FirebaseAuth
import FirebaseDatabase
import Firebase

class StudentServices{
    
    
    static func createNewStudent(withStudent student: Student){
        
        
        
        guard let email   = student.email, let password = student.password
            
            else {return}
        
        // email should be check as edu domain before being passed in this function
        Auth.auth().createUser(withEmail: email, password: password)
        
        ////////////////////////////////////////////////////////////////////////
        //Procced the error call here, error FIRAuthErrorCodeEmailAlreadyInUse//
        ///////////////////////////////////////////////////////////////////////
        
        let studentInfoRef   = NetworkConstant.studentInfoRef
        
                    //retrieve the student uid
        student.uid = Auth.auth().currentUser?.uid
        
                    // Add the new student info in the database under child student info
        studentInfoRef.setValue(["studentInfo": student]){(error,studentInfoRef) in
            if let error      = error{
                assertionFailure(error.localizedDescription)

            }
            Student.setCurrent(student, writeToUserDefault: true)
        }
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
        let email         = String(email)
        let password      = String(password)
        
        Auth.auth().signIn(withEmail: email!, password: password!)
        
        /////////////////////////////////////////////////////////////////////////////
        // procced herror handling here with error: FIRAuthErrorCodeWrongPassword//
        ///////////////////////////////////////////////////////////////////////////
        let ref = NetworkConstant.studentInfoRef

        ref.observeSingleEvent(of: .value, with: {(snapshot) in
            
            guard let student = Student(snapshot: snapshot)
                
                else{return}
            
            Student.setCurrent(student, writeToUserDefault: true)
            signinsuccess = true
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

































