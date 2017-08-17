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
    
    static func createTeacher(withTeacher teacher: Teacher, password: String){
        
        guard let email = teacher.email
            else {return}
        
        Auth.auth().createUser(withEmail: email, password: password)
        
        teacher.uid = Auth.auth().currentUser?.uid
        
        NetworkConstant.AddTeacherinDatabase(withTeacher: teacher)
    }//end of create new teacher
    
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








