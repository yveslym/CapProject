//
//  LoginViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 7/31/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
  
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var choise: UISegmentedControl!
    
    @IBOutlet weak var eduAlestLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    @IBAction func verifyEmailText(_ sender: Any) {
        
        let email = emailTextField.text
        eduAlestLabel.isHidden = true
        if Helpers.checkEmailEdu(forEmail: email!) == false{
                eduAlestLabel.isHidden = false
                eduAlestLabel.isHighlighted = true
        
}       
        }
    
    @IBAction func registerTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "register", sender: self)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let email =  emailTextField.text
        let password = passwordTextField.text
        //let UID = NetworkConstant.uid
        
        if Helpers.checkEmailEdu(forEmail:email!) == true{
            
            if choise.selectedSegmentIndex == 0{
                
                if StudentServices.SignInStudent(email: email, password: password) == true{
                   
                    let initialVC = UIStoryboard.initialViewController(for: .main)
                    self.view.window?.rootViewController = initialVC
                    self.view.window?.makeKeyAndVisible()
                }//end of logIn
            }//end of segment choice
            
            else if choise.selectedSegmentIndex == 1{
                
                if TeacherServices.SignIn(withEmail: email!, password: password!) == true{
                    let initialVC = UIStoryboard.initialViewController(for: .main)
                    self.view.window?.rootViewController = initialVC
                    self.view.window?.makeKeyAndVisible()
                }//end of login teacher
            }//end of segment choise
        }
        else{
            
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
