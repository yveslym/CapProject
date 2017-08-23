//
//  QRScannerViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/17/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit
import SwiftQRCode

class QRScannerViewController: UIViewController {

    @IBOutlet weak var complete: UIButton!
    let student = Student(withEmail:"yves@gmail.com", password: "songolo93")
    var courseIDScanned:String!
    var AttendanceScanned: String!
      var keys: String?
    let scanner = QRCode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        scanner.prepareScan(view) { (stringValue) -> () in
            print(stringValue)
            self.keys = stringValue
        }
        scanner.scanFrame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         complete.isHidden = false
    
        // start scan
        scanner.startScan()
        print(keys)

    }
    
    
    
    @IBAction func done(_ sender: Any) {
        print (self.keys)
        let keyArray = keys?.components(separatedBy: " ")
        self.courseIDScanned = keyArray?[0] // retrieve the course key from scan code
        self.AttendanceScanned = keyArray?[1] // retrieve attendance key from scan code
        
        StudentServices.addNewCourse(withStudent: self.student, courseIDScanned: courseIDScanned, AttendanceScanned: AttendanceScanned, completion: {(added)in
            print("course add: \(added)")
        })
        self.scanner.stopScan()
        self.performSegue(withIdentifier: "return", sender: self)
        
    }
    

}
