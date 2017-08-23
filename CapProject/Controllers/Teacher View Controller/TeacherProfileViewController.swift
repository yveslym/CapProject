//
//  TeacherProfileViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/22/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit

class TeacherProfileViewController: UIViewController {
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var userName: UITextField!
    
    let teacher = Teacher()
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
        // prepare to set Current Teacher
        teacher.firstName = self.firstName.text!
        teacher.lastName = self.lastName.text!
        teacher.username = self.userName.text!
        
        Teacher.setCurrent(teacher: teacher, WritetoTeacherDefault: true)
        NetworkConstant.Teacher.updateFirstName(firstname: firstName.text!)
        NetworkConstant.Teacher.updateLastName(lastname: lastName.text!)
        NetworkConstant.Teacher.updateUsername(withUsername: userName.text!)
        
        //call the main page
        let initialVC = UIStoryboard.initialViewController(for: .teacherMain)
        self.view.window?.rootViewController = initialVC
        self.view.window?.makeKeyAndVisible()
        
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
