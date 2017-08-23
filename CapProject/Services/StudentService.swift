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
import FirebaseAuth.FIRAuthErrors
import Firebase
import UIKit
import SwiftQRCode
import AVFoundation



enum FIRAuthErrorCode: Int{
    case invalidEmail = 17008
    case wrongPassword = 17009
    case userNotFound = 17011
    case weakPassword = 17026
    case emailAlreadyInUse = 17007
}

class StudentServices{
    
    
    
    static func createNewStudent(withEmail email:String!, password: String!, completion: @escaping (Student?) -> Void) {
        
        guard let email   = email, let password = password
            else {return}
        
        let student = Student()

        Auth.auth().createUser(withEmail: email, password: password, completion: {(Authstudent,error) in
            
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
                
                student.email = email
                student.password = password
                
                let StudentAtribute = [Constants.firstName: student.firstName, Constants.lastName: student.lastName, Constants.email: student.email,Constants.username:student.username, Constants.uid: Authstudent?.uid]
                
                NetworkConstant.studentInfoRef.setValue(StudentAtribute)
                Student.setCurrent(student)
                completion(student)

            }
        })//end of sign up
        
        
    }
    
    //Function to retrieve student info from the firebase
    
    static func RetrieveStudentInfo(ForUID uid: String, completion: @escaping (Student?)->Void){
        
        let stringStudent = Constants.studentInfo
        
        let ref = NetworkConstant.rootRef.child( uid).child(stringStudent)
        
        ref.observeSingleEvent(of: .value, with: {(snapshot) in
            
            guard let student = Student(snapshot: snapshot) else{
                
                return completion(nil)
            }
            
            Student.setCurrent(student: student)
            
            completion(student)
            
        })
    }
    
    static func SignInStudent(email: String!, password: String!, completion: @escaping (Student?)->Void){
        
        guard let Email = email, let Password = password
            else {return}
        
        Auth.auth().signIn(withEmail: Email, password: Password, completion: {(authStudent,error) in
            
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
                StudentServices.RetrieveStudentInfo(ForUID: (authStudent?.uid)!, completion: {(student)in
                    if let student = student{
                        Student.setCurrent(student, writeToUserDefault: true)
                        completion(student)
                    }
                    else{
                        print("couldn't retrieve student from firebase")
                    }
                    
                })
            }
        })
    }
    
    
    
    
    
    
    static func logOutStudent()->Bool{
        
             ///////////////////////////////////////
            //                                  //
           // logout logic need to be add here//
          //                                //
        ////////////////////////////////////
        
        return true
    }
    
    
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
                
                let attandanceRef = NetworkConstant.attencace.attendanceRef(withCourseKey: courseIDScanned!, AttendanceKey: AttendanceScanned!)
                let attendanceKey = attandanceRef.key as String
                
                if AttendanceScanned == attendanceKey{
                    let attdc = Attendance()
                    attdc.marckPresent()
                    mycourse.attendance.append(attdc)
                }
            }
        }
    }
    
    // student add new course using  courseIDScanned from teacher device
    // parameter=> student (current Student), courseIDScanned, attendance Scanned
    static func addNewCourse (withStudent student: Student,courseIDScanned : String?, AttendanceScanned : String!,
 completion: @escaping (Bool?)-> Void){
        
        let courseref = NetworkConstant.course.courseRef.child(courseIDScanned!)
        
        courseref.observeSingleEvent(of: .value, with:{ (snapshot)in
          
            let newcourse = Course(snapshot: snapshot)!
            
//            let attencanceRef = NetworkConstant.attencace.attendanceRef(withCourseKey: courseIDScanned!, AttendanceKey: AttendanceScanned)
            
            
            student.AddCourse(withCourse: newcourse)
            
            
            
            print (student.course[0].courseName)
            

        })

    }
}

































