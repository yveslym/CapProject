//
//  loginNetwork.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

typealias FIRUser         = FirebaseAuth.user

struct NetworkConstant
{
    
 let uid                   = Auth.auth().currentUser?.uid
static let currentUser    = Auth.auth().currentUser!
static let rootRef        = Database.database().reference()
static let studentRef     = Database.database().reference().child("students").child((Auth.auth().currentUser?.uid)!)
static let teacherRef     = Database.database().reference().child("teachers").child((Auth.auth().currentUser?.uid)!)
static let studentInfoRef = Database.database().reference().child("students").child((uid).child("studentInfo")
    
static let teacherInfoRef = Database.database().reference().child("teachers").child(().child("teacherInfo")
}
