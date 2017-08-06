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
    
    static func createTeacher(withTeacher teacher: Teacher, completion:@escaping(Teacher?)->Void){
        
        let teacherInfoRef = NetworkConstant.teacherInfoRef
        
        // check if email domain is edu before passing student here
        guard let email = teacher.email,let password = teacher.password
            else {return}
        
        Auth.auth().createUser(withEmail: email, password: password)
        
        ////////////////////////////////////////////////////////////////////////
        //Procced the error call here, error FIRAuthErrorCodeEmailAlreadyInUse//
        ///////////////////////////////////////////////////////////////////////
        
        //retrieve new teacher uid
        teacher.uid = Auth.auth().currentUser?.uid
        
        // Add teacher into the database
        
        teacherInfoRef.setValue(["teacherInfo":teacher]){(error,teacherInfoRef)in
            if let error      = error{
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            Teacher.setCurrent(teacher: teacher, WritetoTeacherDefault: true)
        }
        completion(teacher)
    }
    
    static func retrieveTeacherInfo(WithUID uid: String,completion:@escaping (String?)->Void){
        
        let stringTeacher = "teacherInfo"
        
        let ref = NetworkConstant.rootRef.child(uid).child(stringTeacher)
        
        ref.observeSingleEvent(of: .value, with:{(snapshot) in
            guard let teacher = Teacher(snapshot: snapshot) else {
                return completion (nil)
            }
            Teacher.setCurrent(teacher: teacher)
            
            completion(uid)
        })
    }
    
    static func SignIn(withEmail email: String!, password: String!)-> Bool{
        
        var signInsuccess = false
        let email = String(email)
        let password = String(password)
        
        if Helpers.checkEmailEdu(forEmail: email!){
            Auth.auth().signIn(withEmail: email!, password: password!)
            /////////////////////////////////////////////////////////////////////////////
            // procced herror handling here with error: FIRAuthErrorCodeWrongPassword//
            ///////////////////////////////////////////////////////////////////////////
            
            
            let ref = NetworkConstant.teacherInfoRef
            
            ref.observeSingleEvent(of: .value, with: {(snapshot) in
                guard let teacher = Teacher(snapshot: snapshot)
                    else{return}
                Teacher.setCurrent(teacher: teacher, WritetoTeacherDefault: true)
                signInsuccess = true
            })
            
        }
        return signInsuccess
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








