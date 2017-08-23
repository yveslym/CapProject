//
//  studentRegisterViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/6/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class studentRegisterViewController: UIViewController {

   
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confPassword: UITextField!
    
    
    
    //check if password and passsword verification match
    
    @IBAction func checkPasswordMatch(_ sender: Any) {
        
    }
    
    //sign up student
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        
        
        let student = Student(withEmail: email.text!, password: password.text!)
        
        let firUser = Auth.auth().currentUser!
        
        StudentServices.createNewStudent(withEmail: email.text!, password: password.text!){(cStudent)in
            guard cStudent != nil else {return}
            
        print(cStudent!)
        }
        
       self.performSegue(withIdentifier: "profile", sender: self)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
