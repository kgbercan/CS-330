//
//  RowerTableViewController.swift
//  PaceGuide
//
//  Created by Karina Bercan on 5/5/16.
//  Copyright © 2016 Karina Bercan. All rights reserved.
//

import UIKit

class RowerTableViewController: UITableViewController {
    
    //MARK: Properties
    @IBOutlet weak var rowerLabel: UILabel!
    @IBOutlet weak var rowerTextField: UITextField!
    @IBOutlet weak var fiveHundLabel: UILabel!
    @IBOutlet weak var fiveHundTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    // an Optional Rower
    var rower: Rower?
    // initial array of rowers...empty for now
    var rowers: [Rower] = [Rower(name: "None", fivehund: "")]
    
    // when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false
        
        // displays an edit button to delete items
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    // when you click save
    @IBAction func saveTapped(sender:AnyObject){
        // creates a rower with the values you entered
        rower = Rower(name: rowerTextField.text!, fivehund: fiveHundTextField.text!)
        // adds the rower to the array
        rowers.append(rower!)
        // prints to the console so I know its real
        for r in rowers{
            print("\(r.name) \(r.fivehund)")
        }
        // resets the fields
        rowerTextField.text = ""
        fiveHundTextField.text = ""
        // reloads the table
        self.tableView.reloadData()
    }
    
    // this is a function which intends to return the array of rowers
    // I call it in the first page of the app so that the picker wheel has all the rowers stored
    // but it isn't useful because when I print , I see that the only value it has is "None"
    // even after I've updated the table with more rowers
    // and even though in my saveTapped() the print statement prints all the new rowers
    // I'm not sure how to update the array
    func getRowers() -> [Rower] {
        // it prints the array
        for r in rowers{
            print("\(r.name) \(r.fivehund)")
        }
        // and returns it
        return(rowers)
    }

    ///// table /////
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // number of columns...I just left it at 1
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of entries in the table
        // number of rowers in my array
        return rowers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // connects to the RowerTableViewCell file which has the labels
        let cellIdentifier = "RowerTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RowerTableViewCell
        
        // adds a rower
        let rower = rowers[indexPath.row]
        cell.nameLabel.text = rower.name
        cell.timeLabel.text = rower.fivehund
        // returns the cell to be displayed
        return cell
    }
    
    // lets you edit the row
    // ie delete a rower
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            rowers.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    /////////////////
    
    //////// the following come with files in swift
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
