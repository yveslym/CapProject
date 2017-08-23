//
//  Teacher.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

class Teacher: NSObject{
    
    var username: String?
    var firstName: String?
    var lastName: String?
    var email : String?
    var password:String?
    var phoneNumber : Int?
    var uid : String?
    let type = "teacher"
    var course = [Course]()
    var profilImage : UIImage
    
    
    private static var _current : Teacher?
    
    static var current : Teacher{
        guard let teacher = _current else { fatalError("Teacher doesn't exist")}
        return teacher
    }
    
    override init(){
        self.username = ""
        self.lastName = ""
        self.password = ""
        self.email = ""
        self.firstName = ""
        self.phoneNumber = 0
        self.uid = ""
        self.profilImage = UIImage()
    }
    
    init(firstname: String, lastname: String,Username:String,email:String, phone:Int){
        self.firstName = firstname
        self.lastName = lastname
        self.email = email
        self.username = Username
        self.password = ""
        self.phoneNumber = 0
        self.uid = ""
        self.profilImage = UIImage()
        
    }
    
    init (withEmail email: String!){
        self.username = ""
        self.lastName = ""
        self.password = ""
        self.email = email
        self.firstName = ""
        self.phoneNumber = 0
        self.uid = ""
        self.profilImage = UIImage()
  
    }
    
    init? (snapshot: DataSnapshot){
        guard let dict = snapshot.value as? [String:Any]
            
            else{return nil}
        
        let teacher = dict["info"] as? Teacher
        
        self.firstName = teacher?.firstName
        self.lastName = teacher?.lastName
        self.email = teacher?.email
        self.phoneNumber = teacher?.phoneNumber
        self.uid = teacher?.uid
        self.password = ""
        self.username = teacher?.username
        self.profilImage = (teacher?.profilImage)!
        
    }
    
    class func setCurrent(teacher: Teacher, WritetoTeacherDefault: Bool = false){
        
        if WritetoTeacherDefault == true{
            
            let userType = UsersType()
            
            userType.saveTeacher(withTeacher: teacher, archiveThisTeacher: true)
            
            let data = NSKeyedArchiver.archivedData(withRootObject: userType)
            
            UserDefaults.standard.set(data, forKey: Constants.current)
        }// end of archiving
        _current = teacher
    }// end of setCurrent
    
    static func setCurrent(teacher:Teacher){
        _current = teacher
    }
    
    func getUID (isTeacherAuth: Bool = false){
        
        if isTeacherAuth == true{
            self.uid = Auth.auth().currentUser?.uid
        }
    }

    func createCourse(withCourse course: Course){
        self.course.append(course)
    }
    
}





























