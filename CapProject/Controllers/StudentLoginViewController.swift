//
//  StudentLoginViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/6/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
import Firebase


typealias FIRUser = FirebaseAuth.User

class StudentLoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var EmailTF: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var registerButtonT: UIButton!
    
    @IBOutlet weak var alertMessage: UILabel!
    
   
    //log in student when login button tapped
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        StudentServices.SignInStudent(email: EmailTF.text, password: password.text, completion: {(student) in
        
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
    
        //register student segue
    
    @IBAction func registerBT(_ sender: Any) {
        let register = "register"
        print ("register button tapped")
        self.performSegue(withIdentifier: register, sender: self)
        
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
