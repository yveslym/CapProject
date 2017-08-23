//
//  chooseUserViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/6/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit

class chooseUserViewController: UIViewController {

    
    @IBOutlet weak var StudentButton: UIButton!
    
    @IBOutlet weak var teacherButton: UIButton!
    
<<<<<<< HEAD
    var teacherSelected = false
    var studentSelected = false
    
    
    @IBAction func studentButtonTapped(_ sender: Any) {
        let login = "login"
        performSegue(withIdentifier: login, sender: self)
=======
    
    @IBAction func studentButtonTapped(_ sender: Any) {
        
        let login = "login"
        self.performSegue(withIdentifier: login, sender:self)
        
>>>>>>> parent of 955b75c... about to split qr code with vc
    }
    
    @IBAction func teacherButtonTapped(_ sender: Any) {
<<<<<<< HEAD
        let login = "login"
        teacherSelected = true
        self.performSegue(withIdentifier: login, sender: self)
=======
>>>>>>> parent of 955b75c... about to split qr code with vc
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if let identifier = segue.identifier {
            if identifier == "login" {
                print("Transitioning to the Patient Detail VC")
                let loginvc = segue.destination as! LoginViewController
            
                loginvc.teacherSelected = self.teacherSelected
                loginvc.studentSelected = self.studentSelected
                
            }
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
