//
//  RangeSlider.swift
//  PaceGuide
//
//  Code from Ray Wenderlich: https://www.raywenderlich.com/76433/how-to-make-a-custom-control-swift
//  Slightly adapted continueTrackingWithTouch() so that min and max thumbs are not fixed as min or max; they can overlap
//

import UIKit
import QuartzCore

class RangeSlider: UIControl {
    
    //to render the various components of the slider control
    // the track
    let trackLayer = RangeSliderTrackLayer()
    // the lower thumb
    let lowerThumbLayer = RangeSliderThumbLayer()
    // the high thumb
    let upperThumbLayer = RangeSliderThumbLayer()
    //used to track the touch locations
    var previousLocation = CGPoint()
    
    // cant go below 55%
    var minimumValue: Double = 55{
        didSet{
            updateLayerFrames()
        }
    }
    // cant go above 95%
    var maximumValue: Double = 95{
        didSet{
            updateLayerFrames()
        }
    }
    // initializes the lower value to 60
    var lowerValue: Double = 60{
        didSet{
            updateLayerFrames()
        }
    }
    // initializes the higher value to 70
    var upperValue: Double = 70{
        didSet{
            updateLayerFrames()
        }
    }
    
    // changes the color of the track
    var trackTintColor: UIColor = UIColor(white: 0.9, alpha: 1.0){
        didSet{
            trackLayer.setNeedsDisplay()
        }
    }

    var trackHighlightTintColor: UIColor = UIColor(red: 0.0, green: 0.45, blue: 0.94, alpha: 1.0){
        didSet{
            trackLayer.setNeedsDisplay()
        }
    }
    
    // changes the color of the thumbs
    var thumbTintColor: UIColor = UIColor.whiteColor(){
        didSet{
            lowerThumbLayer.setNeedsDisplay()
            upperThumbLayer.setNeedsDisplay()
        }
    }
    
    // makes the thumbs circles
    var curvaceousness: CGFloat = 1.0{
        didSet{
            trackLayer.setNeedsDisplay()
            lowerThumbLayer.setNeedsDisplay()
            upperThumbLayer.setNeedsDisplay()
        }
    }
    
    //for layout purposes
    // sets the size of the thumb
    var thumbWidth: CGFloat{
        return(CGFloat(bounds.height))
    }
    
    // frame is a rectangle
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    //initilizer
    override init(frame: CGRect){
        super.init(frame: frame)
        
        trackLayer.rangeSlider = self
        trackLayer.contentsScale = UIScreen.mainScreen().scale
        layer.addSublayer(trackLayer)
        
        lowerThumbLayer.rangeSlider = self
        upperThumbLayer.rangeSlider = self
        
        lowerThumbLayer.rangeSlider = self
        lowerThumbLayer.contentsScale = UIScreen.mainScreen().scale
        layer.addSublayer(lowerThumbLayer)
        
        upperThumbLayer.rangeSlider = self
        upperThumbLayer.contentsScale = UIScreen.mainScreen().scale
        layer.addSublayer(upperThumbLayer)
    }
    
    required init(coder: NSCoder){
        super.init(coder: coder)!
    }
    
    //creates three layers and adds them as chrildren to root layer
    func updateLayerFrames(){
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        trackLayer.frame = bounds.insetBy(dx: 0.0, dy: bounds.height / 3)
        trackLayer.setNeedsDisplay()
        
        // sets the thumb to initial value
        let lowerThumbCenter = CGFloat(positionForValue(lowerValue))
        // sets the size of the thumb frame
        lowerThumbLayer.frame = CGRect(x: lowerThumbCenter - thumbWidth / 2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        lowerThumbLayer.setNeedsDisplay()
        
        // sets the upper thmb to initial value
        let upperThumbCenter = CGFloat(positionForValue(upperValue))
        // sets the size of the thumb frame
        upperThumbLayer.frame = CGRect(x: upperThumbCenter - thumbWidth / 2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        upperThumbLayer.setNeedsDisplay()
        
        CATransaction.commit()

    }
    
    //maps a value to a location on screen using a ratio to scale the position between the min and max range of the control
    func positionForValue(value: Double) -> Double{
        return Double(bounds.width - thumbWidth) * (value - minimumValue) / (maximumValue - minimumValue) + Double(thumbWidth / 2.0)
    }
    
    //invoked when the user first touches the control
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        previousLocation = touch.locationInView(self)
        
        // Hit test the thumb layers
        if lowerThumbLayer.frame.contains(previousLocation){
            lowerThumbLayer.highlighted = true
        }
        else if upperThumbLayer.frame.contains(previousLocation){
            upperThumbLayer.highlighted = true
        }
        return(lowerThumbLayer.highlighted || upperThumbLayer.highlighted)
    }
    
    
    //will clamp the passed in value so it is within the specified range
    //instead of a nexted min/max call
    //func boundValue(value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double{
    //    return(min(max(value, lowerValue),upperValue))
    //}
    
    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        let location = touch.locationInView(self)
        
        //determine how much the user has dragged
        //calculate the delta location, which determines # of pixels the user's finger travelled
        let deltaLocation = Double(location.x - previousLocation.x)
        //convert to a scaled delta value based on the min and max values of the control
        let deltaValue = (maximumValue - minimumValue) * deltaLocation/Double(bounds.width - thumbWidth)
        
        previousLocation = location
        
        //update the values
        if lowerThumbLayer.highlighted{
            if(lowerValue>=minimumValue || lowerValue<=maximumValue){
                lowerValue = lowerValue + deltaValue
                //
                //
                // KARINA ADDED THE FOLLOWING IF/ELSE IF BLOCK
                //
                //
                if lowerValue>maximumValue{
                    lowerValue=maximumValue
                }
                else if lowerValue<minimumValue{
                    lowerValue=minimumValue
                }
                //
                //
                //
                //
           // lowerValue = boundValue(lowerValue, toLowerValue: minimumValue, upperValue: upperValue)
            }
        }
        else if upperThumbLayer.highlighted{
            upperValue = upperValue + deltaValue
            //
            //
            // KARINA ADDED THE FOLLOWING IF/ELSE IF BLOCK
            //
            //
            if upperValue>maximumValue{
                upperValue=maximumValue
            }
            else if upperValue<minimumValue{
                upperValue=minimumValue
            }
            //
            //
            //
            //
         //   upperValue = boundValue(upperValue, toLowerValue: lowerValue, upperValue: maximumValue)
        }
        
        sendActionsForControlEvents(.ValueChanged)
        
        return(true)
    }
    
    override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        lowerThumbLayer.highlighted = false
        upperThumbLayer.highlighted = false
    }

}
