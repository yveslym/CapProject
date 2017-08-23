//
//  StudentResourceViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/10/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit
import SwiftQRCode

class StudentResourceViewController: UIViewController {

    @IBOutlet weak var returnButton: UIBarButtonItem!
    @IBOutlet weak var barcodeView: UIImageView!
    @IBOutlet var cameraview: UIView!
    let scanner = QRCode()
    let student = Student(withEmail:"yves@gmail.com", password: "songolo93")
    
    

    @IBAction func unwindToHomePageTableViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            } else if identifier == "save" {
                print("Save button tapped")
            }
        }
    }
    
    
    @IBAction func createCourse(_ sender: Any) {
        let teacher = Teacher()
        let course = Course()
        course.courseName = "math"
        course.Description = "study math"
        course.section = "101"
        
        
        teacher.createCourse(withCourse: course)
        
        teacher.genrateQRCode(CourseIndex: 0, iconView: self.barcodeView)
    }
    
    
    @IBAction func completed(_ sender: Any) {
        performSegue(withIdentifier: "completed", sender: self)
    }
    
    @IBAction func scanCode(_ sender: Any) {
        
        
        StudentServices.ScanAttendance(withStudent: self.student, completion: {(added)in
          print (added)
        })
    }
    

    @IBAction func AddNewcourse(_ sender: Any) {
        
       self.performSegue(withIdentifier: "completed", sender: self)
    }
}
