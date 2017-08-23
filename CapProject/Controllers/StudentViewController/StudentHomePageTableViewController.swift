//
//  StudentHomePageTableViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/10/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit

class StudentHomePageTableViewController: UITableViewController {
    
    @IBOutlet weak var slideButton: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if self.revealViewController() != nil{
            slideButton.target = self.revealViewController()
            slideButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 290
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        

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
