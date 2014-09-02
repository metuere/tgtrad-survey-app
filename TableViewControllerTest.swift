//
//  TableViewControllerTest.swift
//  guest-survey
//
//  Created by Luke.Gesior on 8/29/14.
//  Copyright (c) 2014 Daniel.Chahla. All rights reserved.
//

//
//  ViewController.swift
//  SwiftTable
//
//  Created by Tim on 20/07/14.
//  Copyright (c) 2014 Charismatic Megafauna Ltd. All rights reserved.
//

import UIKit

class TableViewControllerTest: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "cellIdentifier"
    //var tableData: [String] = ["One", "Two", "Three"]
    var model :SurveysModel = SurveysModel(JSON.parse("{\"surveys\":[{\"name\":\"Survey Number 1\",\"owner\":\"Daniel Chahla\",\"maxResponses\":200,\"campaign\":\"Test Survey\",\"costCenterId\":\"none\",\"netWorth\":100,\"logoUrl\":\"luke.com\",\"status\":\"open\",\"_id\":\"5405e4324b6a27375d7420fa\",\"questions\":[{\"text\":\"Best Color?\",\"_id\":\"5405e4324b6a27375d7420fc\",\"answers\":[\"blue\",\"red\"]},{\"text\":\"Favorite Bird?\",\"_id\":\"5405e4324b6a27375d7420fb\",\"answers\":[\"African Swallow\",\"European Swallow\"]}],\"__v\":0},{\"name\":\"Survey Number 2\",\"owner\":\"Sir Daniel Chahla\",\"maxResponses\":200,\"campaign\":\"Test Survey 2\",\"costCenterId\":\"none\",\"netWorth\":300,\"logoUrl\":\"deluxe.com\",\"status\":\"open\",\"_id\":\"5405e49b606bb3415df31e17\",\"questions\":[{\"text\":\"Greatest NFL Team?\",\"_id\":\"5405e49b606bb3415df31e19\",\"answers\":[\"Vikings\",\"Packers\"]},{\"text\":\"Ambiturner?\",\"_id\":\"5405e49b606bb3415df31e18\",\"answers\":[\"Yes\",\"No\"]}],\"__v\":0}]}"))
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the UITableViewCell class with the tableView
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return model.surveys.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        
        cell.textLabel.text = self.model.surveys[indexPath.row].name
        println(self.model.surveys[indexPath.row].name)
        return cell
        
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        
        
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row) the owner is: \(self.model.surveys[indexPath.row].name), the maxResponses is: \(self.model.surveys[indexPath.row].maxResponses), the campaign is: \(self.model.surveys[indexPath.row].campaign), the costCenterId is:  \(self.model.surveys[indexPath.row].costCenterId), the netWorth is:  \(self.model.surveys[indexPath.row].netWorth)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
}


