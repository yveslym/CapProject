//
//  StudentReg.swift
//  CapProject
//
//  Created by Yves Songolo on 8/5/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit

class StudentReg: UIViewController {

    @IBOutlet weak var fnameTF: UITextField!
    
    @IBOutlet weak var lnameTF: UITextField!
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var VerifiyPSTF: UITextField!
    
    @IBOutlet weak var PWalertmessage: UILabel!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var emailAlertTF: UILabel!
    
    @IBAction func matchPW(_ sender: Any) {
        
        if passwordTF != VerifiyPSTF{
            PWalertmessage.isHidden = false
        }
        else{
            PWalertmessage.isHidden = true
        }
    }
    
    @IBAction func checkEmail(_ sender: Any) {
        if Helpers.checkEmailEdu(forEmail: emailTF.text!) == false{
            emailAlertTF.isHidden = false
        }else{
            emailAlertTF.isHidden = true
        }
        
    }
    
    
    @IBAction func NextButtonTapped(_ sender: Any) {
        let student = Student(firstname: fnameTF.text!, lastname: lnameTF.text!, Username: usernameTF.text!, email: emailTF.text!, password: VerifiyPSTF.text!, phone: 0)
        
        StudentServices.createNewStudent(withStudent: student)
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
