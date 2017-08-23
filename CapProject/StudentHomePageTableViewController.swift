//
//  StudentHomePageTableViewController.swift
//  CapProject
//
//  Created by Yves Songolo on 8/9/17.
//  Copyright © 2017 Yveslym. All rights reserved.
//

import UIKit

class StudentHomePageTableViewController: UITableViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    
    func sideMenu(){
     
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

<<<<<<< HEAD:CapProject/Controllers/StudentViewController/StudentHomePageTableViewController.swift
=======
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
>>>>>>> parent of 955b75c... about to split qr code with vc:CapProject/StudentHomePageTableViewController.swift
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
