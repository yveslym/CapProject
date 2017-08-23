//
//  RegisterViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/22/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    var studentSelected: Bool?
    var teacherSelected: Bool?
    
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
        if studentSelected == true{
            
            StudentServices.createNewStudent(withEmail: email.text!, password: password.text, completion: {(student) in
                if student != nil{
                    print("student create")
                    self.performSegue(withIdentifier: "studentProfile", sender: self)
                }
            })
        }
        else if teacherSelected == true{
            
            TeacherServices.createTeacher(withEmail: email.text!, password: password.text!, completion: {(teacher) in
                
                if teacher != nil{
                    print("teacher register")
                    
                    self.performSegue(withIdentifier: "teacherProfile", sender: self)
                }
                else{
                print("teacher not register")
                }
        })
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
    
    
    
}
