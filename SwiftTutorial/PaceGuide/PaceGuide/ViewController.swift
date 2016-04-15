//
//  ViewController.swift
//  PaceGuide
//
//  Created by Karina Bercan on 3/31/16.
//  Copyright © 2016 Karina Bercan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let guide = PaceGuideModel()
    var time: String!
    var pct: Int!
    var goal: String!
    
    @IBOutlet var fiveHundTextField: UITextField!
    @IBOutlet var pctSlider: UISlider!
    @IBOutlet var pctLabel: UILabel!
    @IBOutlet var goalsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI(){
        time = fiveHundTextField.text
        pct = Int(pctSlider.value)
        pctLabel.text = "Percentage (\(Int(pctSlider.value))%)"
        goalsTextView.text = goal
    }
    
    @IBAction func reportTapped(sender:AnyObject){
        goal = guide.pace(pct, max: pct, test: time)
        refreshUI()
    }
    
    @IBAction func pctChanged(sender:AnyObject){
        pct = Int(pctSlider.value)
        refreshUI()
    }
    
    @IBAction func viewTapped(sender:AnyObject){
        fiveHundTextField.resignFirstResponder()
    }
    
    


}

