//
//  teacherRegisterViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/8/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit
class teacherRegisterViewController: UIViewController {

    
    @IBOutlet weak var fname: UITextField!
    
    @IBOutlet weak var lname: UITextField!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
    
        if ((fname.text?.isEmpty)! && (lname.text?.isEmpty)! && (username.text?.isEmpty)! && (email.text?.isEmpty)!){
        if self.password.text != self.confirmPassword.text{return}
        
    let teacher = Teacher(firstname: fname.text!, lastname: lname.text!, Username: username.text!, email: email.text!, phone: 0)
    
        TeacherServices.createTeacher(withTeacher: teacher, password: password.text!)
       
        let initialVC = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialVC
        self.view.window?.makeKeyAndVisible()
        }else {return}
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
