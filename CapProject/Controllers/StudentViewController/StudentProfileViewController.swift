//
//  StudentProfileViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/12/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class StudentProfileViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var educationLevelLabel: UILabel!
    
    @IBAction func PickerViewButtonTapped(_ sender: Any) {
        
        ActionSheetStringPicker.show(withTitle: "", rows: ["undergraduate","graduate","Bachelor","Master"], initialSelection: 1, doneBlock: {
            
            picker, indexes, values in
            
            
            self.educationLevelLabel.text = values as? String
            
            return
            
        }, cancel: {ActionSheetStringPicker in return }, origin: sender)
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        
        //set current student info
        Student.current.level = self.educationLevelLabel.text
        Student.current.firstName = self.firstName.text
        Student.current.lastName = self.lastName.text
        
        // update student in the firebase
        NetworkConstant.updateStudentInfo.FirstName(firstName: firstName.text)
        NetworkConstant.updateStudentInfo.LastName(lastName: lastName.text)
        NetworkConstant.updateStudentInfo.Level(level: educationLevelLabel.text)
        
        //call the main page
        
        let initialVC = UIStoryboard.initialViewController(for: .main)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
