//
//  AttendanceServices.swift
//  CapProject
//
//  Created by Yves Songolo on 8/14/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseAuth.FIRUser
import Firebase


class AttendanceServices: NSObject{
  
    static func create(completion:@escaping (String?)->Void){
        
        let newAttendance = NetworkConstant.attencace.attendanceRef.childByAutoId()
        
        let key = newAttendance.key
        
        completion(key)
    }

    
    
    
    
    
    
    
    
    
}
