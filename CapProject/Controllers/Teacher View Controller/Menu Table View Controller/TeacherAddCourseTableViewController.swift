//
//  TeacherAddCourseTableViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/21/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import DatePickerDialog

class TeacherAddCourseTableViewController: UITableViewController {

    let newCourse:Course? = nil
    
    @IBOutlet weak var courseName: UITextField!
    @IBOutlet weak var courseSection: UITextField!
    @IBOutlet weak var courseStartTime: UILabel!
    @IBOutlet weak var courseEndTime: UILabel!
    
    @IBOutlet weak var sunday: UIButton!
    @IBOutlet weak var monday: UIButton!
    @IBOutlet weak var tuesday: UIButton!
    @IBOutlet weak var wednesday: UIButton!
    @IBOutlet weak var thursday: UIButton!
    @IBOutlet weak var friday: UIButton!
    @IBOutlet weak var saturday: UIButton!
    
    @IBOutlet weak var semesterStart: UILabel!
    @IBOutlet weak var semesterLastDay: UILabel!
    
    @IBAction func courseStartTimeButtonTapped(_ sender: Any) {
       
        
    }
    @IBAction func courseEndTimeButtonTapped(_ sender: Any) {
        
        
    }
    
    //get the first day of course

    @IBAction func semesterStartButtonTapped(_ sender: Any) {
        DatePickerDialog().show(title: "First Day of Class", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            self.semesterStart.text = "\(date!)"
            self.newCourse?.schedule?.dateOfFirstDay = date! as NSDate?
        }
    }
    // get the last day of course
    
    @IBAction func semesterEndDateButtonTapped(_ sender: Any) {
    
        DatePickerDialog().show(title: "Last Day of Class", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            self.semesterLastDay.text = "\(date!)"
            self.newCourse?.schedule?.dateOfLastDay = date! as NSDate?
        }

    }
    
    @IBAction func selectSunday(_ sender: Any) {
     
        self.newCourse?.schedule?.Days?.sunday = !(self.newCourse?.schedule?.Days?.sunday)!
        if self.newCourse?.schedule?.Days?.sunday == true{
            self.sunday.isSelected = true
            self.sunday.titleLabel?.isHighlighted = true
            print("sunday selected")
        }
        else{
            self.sunday.isSelected = false
            self.sunday.titleLabel?.isHighlighted = false
                print ("sunday deselected")
        }
        
    }
    @IBAction func selctMonday(_ sender: Any) {
        
        
    }
    @IBAction func selctTuesday(_ sender: Any) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   

}
