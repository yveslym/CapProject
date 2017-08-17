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
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        var keys: String?
        
       

        scanner.prepareScan(view) { (stringValue) -> () in
                        print(stringValue)
                        keys = stringValue
                    }
        scanner.startScan()
        scanner.scanFrame = view.bounds
        
        let courseIDScanned:String!
        let AttendanceScanned: String!
        
                    //end of scan code
        
        print (keys)
        let keyArray = keys?.components(separatedBy: " ")
                courseIDScanned = keyArray?[0] // retrieve the course key from scan code
                AttendanceScanned = keyArray?[1] // retrieve attendance key from scan code
        
       
        StudentServices.addNewCourse(withStudent: self.student, courseIDScanned: courseIDScanned, AttendanceScanned: AttendanceScanned, completion: {(added)in
          print("course add: \(added)")
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
