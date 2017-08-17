//
//  Teacher.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase
import Firebase
import SwiftQRCode


class Teacher: NSObject{
    
    let username: String?
    let firstName: String?
    let lastName: String?
    let email : String?
    let password:String?
    let phoneNumber : Int?
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
    //function to create course with course as parameter
    func createCourse(withCourse course: Course){
        self.course.append(course)
    }
    
    // function to generate qr code with SwiftQRCode framework
    func genrateQRCode(CourseIndex index:Int, iconView: UIImageView){
        
        let courseID = course[index].courseID
        let todayAttendance = course[index].todayAttendance
        let error = NSError()
        
        if  course[index].courseID == "" {
            
            CourseServices.create(withCoourse: self.course[index], completion: {(created) in
                
                print ("course created: \(String(describing: created))")
            })
        }
        
        if self.isTodayAttendanceExist(CourseIndex: index) == true{
            iconView.image = QRCode.generateImage((courseID)! + " " + (todayAttendance)!, avatarImage: UIImage(named: "avatar"), avatarScale: 0.3)
        }
        else{
            
            var newAttendance : String?
            CourseServices.createAttendance(withCourse: course[index], completion: {(attendance)in
                
                //let key  = ""
                
                if let key = attendance{
                    newAttendance = key
                    print("key in")
                }
                else{
                    print("no key")
                }
            })
            if  newAttendance != ""{
                iconView.image = QRCode.generateImage((courseID)! + " " + (newAttendance)!, avatarImage: UIImage(named: "avatar"), avatarScale: 0.3)
            }
            else {
                print("errrrrooooorrrrrr")
                fatalError(error.localizedDescription)
                
            }
        }
    }
    
    func isTodayAttendanceExist(CourseIndex index:Int)->Bool{
        return (self.course[index].todayAttendance != nil) ?  true :  false
    }
}




























