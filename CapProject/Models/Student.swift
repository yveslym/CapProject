//
//  Student.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase
class Student: NSObject{
    
    var username: String?
    var firstName: String?
    var lastName: String?
    var email : String?
    var password:String?
    let phoneNumber : Int?
    var uid : String?
    let type = "student"
   var course = [Course]()
    var level: String?
    
    private static var _current: Student?
    
    static var current: Student{
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
    
    init (withEmail email: String, password: String){
        self.firstName = ""
        self.lastName  = ""
        self.email     = email
        self.username  = ""
        self.password  = password
        self.uid       = ""
        self.phoneNumber = 0

    }
    
    init(firstname: String = "", lastname: String = "",Username:String = "",email:String = "", password:String = "", phone: Int = 0){
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
        
        let student = dict["info"] as? Student
        self.firstName = student?.firstName
        self.username = student?.username
        self.lastName = student?.lastName
        self.password = ""
        self.email = student?.email
        self.phoneNumber = student?.phoneNumber
        
        
    }
    
    class func setCurrent (_ student: Student, writeToUserDefault : Bool = false){
        
        if writeToUserDefault == true {
            
            let userType = UsersType()
            
            userType.saveStudent(withStudent: student, archivethisStudent: true)
           // let data = NSKeyedArchiver.archivedData(withRootObject: userType)   //archive usertype with student data in it
            
            
            //UserDefaults.standard.set(userType, forKey: Constants.current)  //set user default
        } //end of archiving process
        _current = student
    }// end of setting current
    
    static func setCurrent(student: Student){
        _current = student
    }
    
    func getUID( isStudentAuth: Bool = false){
        
        if isStudentAuth == true{
            
            self.uid = Auth.auth().currentUser?.uid
        }
    }
    
    func AddCourse (withCourse course: Course!){
        self.course.append(course)
    }

}















