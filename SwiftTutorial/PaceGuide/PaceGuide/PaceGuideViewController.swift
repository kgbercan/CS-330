//
//  PaceGuideViewController.swift
//  PaceGuide
//
//  Created by Karina Bercan on 3/31/16.
//  Copyright © 2016 Karina Bercan. All rights reserved.
//
//  RangeSlider adapted from Ray Wenderlich: https://www.raywenderlich.com/76433/how-to-make-a-custom-control-swift

import UIKit

class PaceGuideViewController: UIViewController, UIPickerViewDelegate{
    
    @IBOutlet weak var rowerLabel: UILabel!
    @IBOutlet weak var rowerPicker: UIPickerView!
    @IBOutlet var fiveHundTextField: UITextField!
    @IBOutlet var pctLabel: UILabel!
    @IBOutlet var goalsTextView: UITextView!
    @IBOutlet weak var infoButton: UIBarButtonItem!
    
    // array to store rowers, ideally from the RowerTableViewController
    var rowers: [Rower] = []
    // initializes the pacetable
    let guide = PaceTable()
    // 500 time
    var time: String!
    // lower percent
    var pctLow: Int!
    // higher percent
    var pctHigh: Int!
    // string that holds the final workout goals
    var goal: String!
    // double ended slider
    let pctRangeSlider = RangeSlider(frame: CGRectZero)
    
    
    
    
    // when this page loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // my intention with the following line is to update the rowers array to hold values from the next page where rowers are stored
        // but it doesn't work to update; it only maintains the original "None" rower
        rowers = RowerTableViewController().getRowers()
        
        // I tried to change the font and size of the reported text but I cant make it work
        goalsTextView.font = UIFont(name: "Helvetica", size: 24)
        
        // adds the custom slider object
        view.addSubview(pctRangeSlider)
        // adds a listener
        pctRangeSlider.addTarget(self, action: #selector(PaceGuideViewController.rangeSliderValueChanged), forControlEvents: .ValueChanged)
        
        // refreshed the UI
        refreshUI()
        
    }
    
    // when the UI refreshes
    func refreshUI(){
        // my intention with the following 2 lines is to update the rowers array to hold values from the next page where rowers are stored
        // but it doesn't work to update; it only maintains the original "None" rower
        rowers = RowerTableViewController().getRowers()
        self.rowerPicker.reloadAllComponents();
        
        // sets time to what's typed in the 500m text field
        time = fiveHundTextField.text
        // sets the percentages to what the slider is set at
        // rounds them to the nearest 5% to prevent invalid user input
        pctLow = ((Int(pctRangeSlider.lowerValue))/5)*5
        pctHigh = ((Int(pctRangeSlider.upperValue))/5)*5
        // updates the label based on the slider values
        pctLabel.text = "Percentage (\(pctLow)% - \(pctHigh)%):"
        // prints the goals
        goalsTextView.text = goal
    }
    
    // when the report button is pressed
    @IBAction func reportTapped(sender:AnyObject){
        // sets the goal
        goal = guide.pace(pctLow, max: pctHigh, test: fiveHundTextField.text!)
        // refreshes the UI to print the goal
        refreshUI()
    }
    
    // lets the 500m text field receive a tap
    @IBAction func viewTapped(sender:AnyObject){
        fiveHundTextField.resignFirstResponder()
    }
    
    ///// slider /////
    // controls the size of the slider
    override func viewDidLayoutSubviews() {
        let width = 148.0 //view.bounds.width*0.4
        pctRangeSlider.frame = CGRect(x: 215, y: 259, width: width, height: 31.0)
    }
    
    // when the slider values are changed
    func rangeSliderValueChanged(rangeSlider: RangeSlider){
        // sets the percentage values to what the slider is set to
        pctLow = Int(rangeSlider.lowerValue)
        pctHigh = Int(rangeSlider.upperValue)
        // prints the console so I know it's real
        print("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))\n")
        // refreshes the UI to make the changes
        refreshUI()
    }
    /////////////////
    
    ///// picker (the wheel) /////
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        // components are number of columns
        // my data just has one column
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // sets the number of rows
        // i.e., number of options
        return rowers.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // displays each item from the array rowers
        return rowers[row].name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // what happens when you make a selection
        // saves the selection in rowerSelected
        let rowerSelected = rowers[row]
        // auto-fills the 500m text field w the 500m time stored in that rower
        fiveHundTextField.text = rowerSelected.fivehund
    }
    /////////////////
    
    
    // this is a default function that xcode gives when you start a project
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

