//
//  teacherLoginViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/8/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit

class teacherLoginViewController: UIViewController {
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> parent of 11c4cd0... commit with appdelegate bug

    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
<<<<<<< HEAD
=======
    
    @IBOutlet weak var registerButton: UIButton!
    
    
>>>>>>> parent of 11c4cd0... commit with appdelegate bug
    @IBAction func registerButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "teacherRegister", sender: self)
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if TeacherServices.SignIn(withEmail: email.text!, password: password.text!) == true{
            let initialVC = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialVC
            self.view.window?.makeKeyAndVisible()

            
        }
        else{
            print("COULD NOT LOGIN")
        }
    }
    
    
    
    
    
<<<<<<< HEAD
>>>>>>> parent of 955b75c... about to split qr code with vc
=======
>>>>>>> parent of 11c4cd0... commit with appdelegate bug
    
    
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
