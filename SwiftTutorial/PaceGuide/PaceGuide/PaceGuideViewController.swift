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
    
    var rowers = ["None","Karina"]
    let guide = PaceTable()
    var time: String!
    var pctLow: Int!
    var pctHigh: Int!
    var goal: String!
    let pctRangeSlider = RangeSlider(frame: CGRectZero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    goalsTextView.font = UIFont(name: "Helvetica", size: 24)
    
        
        view.addSubview(pctRangeSlider)
        pctRangeSlider.addTarget(self, action: #selector(PaceGuideViewController.rangeSliderValueChanged), forControlEvents: .ValueChanged)
        
        refreshUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        let width = 148.0 //view.bounds.width*0.4
        pctRangeSlider.frame = CGRect(x: 215, y: 361, width: width, height: 31.0)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(
        pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rowers.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rowers[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var rowerSelected = rowers[row]
        
    }
    
    func refreshUI(){
      //  if rowerPicker.text == "None"{
            time = fiveHundTextField.text
            pctLow = Int(pctRangeSlider.lowerValue)
            pctHigh = Int(pctRangeSlider.upperValue)
            pctLabel.text = "Percentage (\(pctLow)% - \(pctHigh)%):"
            goalsTextView.text = goal
      //  }
      //  else{
            
       // }
    }
    
    @IBAction func reportTapped(sender:AnyObject){
        goal = guide.pace(pctLow, max: pctHigh, test: fiveHundTextField.text!)
        refreshUI()
    }
    
    func rangeSliderValueChanged(rangeSlider: RangeSlider){
      //  let roundedL = round(rangeSlider.lowerValue/5)*5
      //  rangeSlider.lowerValue = roundedL
        pctLow = Int(rangeSlider.lowerValue)
        
     //   let roundedH = round(rangeSlider.upperValue/5)*5
     //   rangeSlider.upperValue = roundedH
        pctHigh = Int(rangeSlider.upperValue)
        
        print("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))\n")
        refreshUI()
    }
    
    @IBAction func viewTapped(sender:AnyObject){
        fiveHundTextField.resignFirstResponder()
    }
    
    


}

