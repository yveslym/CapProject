//
//  user.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase
class Users: NSObject{
    
    let username: String?
    let firstName: String?
    let lastName: String?
    let email : String?
    let password:String?
    let phoneNumber : Int?
    var uid : String?
    let type = "student"
    private static var _current: Users?
    
    static var current: Users{
        guard let currentUser = _current else{
            fatalError("current user doesn't exist")
        }
        return currentUser
    }
    
    override init(){
        self.username  = ""
        self.lastName  = ""
        self.password  = ""
        self.email     = ""
        self.firstName = ""
        self.uid       = ""
        self.phoneNumber = 0
    }
    
    init(firstname: String, lastname: String,Username:String,email:String, password:String, phone: Int){
        self.firstName = firstname
        self.lastName  = lastname
        self.email     = email
        self.username  = Username
        self.password  = password
        self.uid       = ""
        self.phoneNumber = phone
    }
    
    init?(snapshot: DataSnapshot) {
        
        guard let dict = snapshot.value as? [String: Any]
            
            else{return nil}
        
        let users = dict["info"] as? Users
        self.firstName = users?.firstName
        self.username = users?.username
        self.lastName = users?.lastName
        self.password = ""
        self.email = users?.email
        self.phoneNumber = users?.phoneNumber
        
        
    }
    
    class func setCurrent (_ user: Users, writeToUserDefault : Bool = false){
        
        if writeToUserDefault{
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            UserDefaults.standard.set(data, forKey: Constants.current)
        }
        _current = user
    }// archive student
    
    static func setCurrent(user: Users){
        _current = user
    }
    
    func getUID( isStudentAuth: Bool = false){
        
        if isStudentAuth == true{
            
            self.uid = Auth.auth().currentUser?.uid
        }
        
    }
}
