//
//  LoginViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/22/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var teacherSelected : Bool?
    var studentSelected : Bool?
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if self.studentSelected == true{
            
            // login student
            StudentServices.SignInStudent(email: email.text, password: password.text, completion: {(student) in
                
                if student != nil
                {
                    let initialVC = UIStoryboard.initialViewController(for: .main)
                    self.view.window?.rootViewController = initialVC
                    self.view.window?.makeKeyAndVisible()
                }
                else {
                    print(" COULD NOT LOGIN")
                }
                
            })//end of login
        }
            
            // login teacher
        else if self.teacherSelected == true{
            
            TeacherServices.SignIn(withEmail: email.text!, password: password.text!, completion: {(teacher) in
                if teacher != nil{
                    print("teacher login and set as current teacher")
                    let initialVC = UIStoryboard.initialViewController(for: .teacherMain)
                    self.view.window?.rootViewController = initialVC
                    self.view.window?.makeKeyAndVisible()

                }
                else{
                    print("couldn't login teacher")
                }
            })
        }
            
        else{
            print ("both student and teacher was false.. which is not good.. fuck..")
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "register", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "register"{
         let regViewController = segue.destination as? RegisterViewController
            regViewController?.studentSelected = self.studentSelected
            regViewController?.teacherSelected = self.teacherSelected
            
    }
    
}
}


















