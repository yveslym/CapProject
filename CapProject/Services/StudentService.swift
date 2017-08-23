//
//  StudentService.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//
//Student

import Foundation
import FirebaseDatabase
import FirebaseAuth.FIRUser
import Firebase
import UIKit

class StudentServices{
    
    
    
<<<<<<< HEAD
<<<<<<< HEAD
    static func createNewStudent(withEmail email:String!, password: String!, completion: @escaping (Student?) -> Void) {
        
        guard let email   = email, let password = password
=======
    static func createNewStudent(_ firUser: FIRUser, student: Student, password: String, completion: @escaping (Student?) -> Void) {
        
        guard let email   = student.email
>>>>>>> parent of 955b75c... about to split qr code with vc
=======
    static func createNewStudent(_ firUser: FIRUser, student: Student, completion: @escaping (Student?) -> Void) {
        
        guard let email   = student.email, let password = student.password
>>>>>>> parent of 11c4cd0... commit with appdelegate bug
            else {return}
        
        Auth.auth().createUser(withEmail: email, password: password, completion: {(students,error) in
            
            if let error = error {
                assertionFailure(error.localizedDescription)
                
<<<<<<< HEAD
                if let errorCode = FIRAuthErrorCode(rawValue: (error._code)){
                    switch errorCode{
                    case .emailAlreadyInUse: print("email use/ wait for UIAlert")
                    case .weakPassword: print("weak password")
                    case .invalidEmail: print("invalid email")
                    default: assertionFailure(error.localizedDescription)
                    }
                }
<<<<<<< HEAD
                
=======
                return completion(nil)
>>>>>>> parent of 955b75c... about to split qr code with vc
=======
                return completion(nil)
>>>>>>> parent of 11c4cd0... commit with appdelegate bug
            }
            else{
<<<<<<< HEAD
<<<<<<< HEAD
                
                student.email = email
                student.password = password
                
                let StudentAtribute = [Constants.firstName: student.firstName, Constants.lastName: student.lastName, Constants.email: student.email,Constants.username:student.username, Constants.uid: Authstudent?.uid]
                
                NetworkConstant.studentInfoRef.setValue(StudentAtribute)
                Student.setCurrent(student)
                completion(student)

            }
        })//end of sign up
        
=======
                NetworkConstant.AddStudentinDatabase(withStudent: student)            }
        } )//end of sign up
        
        Student.setCurrent(student, writeToUserDefault: true)
        completion(student)
>>>>>>> parent of 955b75c... about to split qr code with vc
=======
                NetworkConstant.AddStudentinDatabase(withStudent: student)
            }
        })//end of sign up
        
        Student.setCurrent(student)
        completion(student)
>>>>>>> parent of 11c4cd0... commit with appdelegate bug
        
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
        
        Auth.auth().signIn(withEmail: email!, password: password!, completion: {(student, error) in
            
            if error == nil{
                print(error.debugDescription)
            }
            else{
<<<<<<< HEAD
<<<<<<< HEAD
                StudentServices.RetrieveStudentInfo(ForUID: (authStudent?.uid)!, completion: {(student)in
=======
                StudentServices.RetrieveStudentInfo(ForUID: NetworkConstant.currentUserUID!, completion: {(student)in
>>>>>>> parent of 11c4cd0... commit with appdelegate bug
                    if let student = student{
                        Student.setCurrent(student, writeToUserDefault: true)
                    }
=======
                let ref = NetworkConstant.studentInfoRef
                
                ref.observeSingleEvent(of: .value, with: {(snapshot) in
                    
                    guard let student = Student(snapshot: snapshot)
                        
                        else{return}
                    
                    Student.setCurrent(student, writeToUserDefault: true)
                    signinsuccess = true
>>>>>>> parent of 955b75c... about to split qr code with vc
                    
                })
            }
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
    
<<<<<<< HEAD
    
    static func ScanAttendance (withStudent student: Student, completion:@escaping (Bool)->Void){
       
        let scanner = QRCode()
        let view = UIView()
        var keys = String()
        let courseIDScanned :String?
        let AttendanceScanned : String?
        
        //start scanning
        scanner.prepareScan(view) { (stringValue) -> () in
            print(stringValue)
            keys = stringValue
        }
        scanner.startScan()
        scanner.scanFrame = view.bounds
        //end of scan code
        
        let keyArray = keys.components(separatedBy: " ")
        courseIDScanned = keyArray[0] // retrieve the course key from scan code
        AttendanceScanned = keyArray[1] // retrieve attendance key from scan code
        
       // let courseRef = NetworkConstant.course.courseRef.child(courseIDScanned!)
        //let courseKey = courseRef.key
        
        for mycourse in student.course{
            if mycourse.courseID == courseIDScanned {
                
                let attandanceRef = NetworkConstant.course.attendanceRef(withCourseKey: courseIDScanned!, AttendanceKey: AttendanceScanned!)
                let attendanceKey = attandanceRef.key as String
                
                if AttendanceScanned == attendanceKey{
                    let attdc = Attendance()
                    attdc.marckPresent()
                    mycourse.attendance.append(attdc)
                }
            }
        }
    }
    
    // student add course 
    static func addNewCourse (withStudent mystudent: Student,courseIDScanned : String?, AttendanceScanned : String?,
 completion: @escaping (Bool?)-> Void){
        
        
        //start scanning
        

        
//        
//        
        
        
        let courseref = NetworkConstant.course.courseRef.child(courseIDScanned!)
        
        courseref.observeSingleEvent(of: .value, with:{ (snapshot)in
          
            let newcourse = Course(snapshot: snapshot)!
            mystudent.AddCourse(withCourse: newcourse)
    print (mystudent.course[0].courseName)
            
            //create a course initialisation with snapshot as parameter to retrieve course data
            //
        })

    }
=======
>>>>>>> parent of 955b75c... about to split qr code with vc
}

































