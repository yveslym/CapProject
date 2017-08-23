//
//  TeacherServices.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import Firebase



class TeacherServices{
    
    static func createTeacher(withEmail email: String!, password: String!,completion:@escaping (Teacher?)->Void){
        
        guard let email = email, let password = password
            else {return}
        
        let teacher = Teacher(withEmail: email)
        
        Auth.auth().createUser(withEmail: email, password: password, completion: {(AuthTeacher,error) in
            
            if let error = error {
                
                if let errorCode = FIRAuthErrorCode(rawValue: (error._code)){
                    switch errorCode{
                    case .emailAlreadyInUse: print("email use/ wait for UIAlert")
                    case .weakPassword: print("weak password")
                    case .invalidEmail: print("invalid email")
                    default: assertionFailure(error.localizedDescription)
                    }
                    return completion(nil)
                }
                
            }
                
            else{
                
                let StudentAtribute = [Constants.firstName: teacher.firstName, Constants.lastName: teacher.lastName, Constants.email: teacher.email,Constants.username:teacher.username, Constants.uid: AuthTeacher?.uid]
                
                NetworkConstant.teacherInfoRef.setValue(StudentAtribute)
                Teacher.setCurrent(teacher: teacher)
                completion(teacher)
                
            }
        })//end of sign up
        
    }//end of create new teacher
    
    static func retrieveTeacherInfo(WithUID uid: String,completion:@escaping (Teacher?)->Void){
        
        let stringTeacher = "teacherInfo"
        
        let ref = NetworkConstant.rootRef.child(uid).child(stringTeacher)
        
        ref.observeSingleEvent(of: .value, with:{(snapshot) in
            guard let teacher = Teacher(snapshot: snapshot)
                else {return completion (nil)}
            completion(teacher)
        })
    }
    
    static func SignIn(withEmail email: String!, password: String!, completion: @escaping(Teacher?)->Void){
        
        Auth.auth().signIn(withEmail: email, password: password, completion: {(authTeacher,error) in
            
            if let error = error{
                
                if let errorCode = FIRAuthErrorCode(rawValue: (error._code)){
                    
                    switch errorCode{
                    case .invalidEmail: print("invalid email")
                    case .userNotFound: print("not user with this email and password")
                    default: print(error.localizedDescription)
                    }
                }
            }
                
            else{
                TeacherServices.retrieveTeacherInfo(WithUID: (authTeacher?.uid)!, completion: {(teacher) in
                    if let teacher = teacher {
                        Teacher.setCurrent(teacher: teacher, WritetoTeacherDefault: true)
                        completion (teacher)
                    }
                    
                })
                
            }
            
        })
    }
    
    
    static func logout()->Bool{
        
        ////////////////////////////////////////
        //                                   //
        // logout logic need to be add here //
        //                                 //
        ////////////////////////////////////
        
        return true
        
    }
    
}








