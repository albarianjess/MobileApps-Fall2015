//
//  ViewController.swift
//  Midterm
//
//  Created by Jessie Albarian on 10/29/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //----------
    // Variables
    //----------
    @IBOutlet weak var totalMiles: UITextField!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var totalGas: UILabel!
    @IBOutlet weak var carBusBike: UISegmentedControl!
    @IBOutlet weak var mainImage: UIImageView!
    
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
    }
    
    
    //-----------------------------------
    // Main calculation from button click
    //-----------------------------------
    @IBAction func doCalc(sender: AnyObject) {
        var numFormatter = NSNumberFormatter()
        numFormatter.numberStyle=NSNumberFormatterStyle.NoStyle
        
        
        let miles = (totalMiles.text as NSString).floatValue
        
        
        
        
        if carBusBike.selectedSegmentIndex == 0 {
            //if car
            mainImage.image=UIImage(named: "car")
            let commuteTime : Float = (miles/(20.0))*60.0
            totalTime.text = (numFormatter.stringFromNumber(commuteTime))! + " minutes"
            //currently rounded up..
            let gasNeed : Float = miles/(24.0)
            totalGas.text = (numFormatter.stringFromNumber(gasNeed))! + " gallons"
        }
        else if carBusBike.selectedSegmentIndex == 1 {
            //if bus
            mainImage.image=UIImage(named: "bus")
            let commuteTime : Float = (miles/(12.0))*60.0 + 10.0
            totalTime.text = (numFormatter.stringFromNumber(commuteTime))! + " minutes"
            let gasNeed = 0
            totalGas.text = (numFormatter.stringFromNumber(gasNeed))! + " gallons"
        }
        else if carBusBike.selectedSegmentIndex == 2 {
            //if bike
            mainImage.image=UIImage(named: "bike")
            let commuteTime : Float = (miles/(11.0))*60.0
            totalTime.text = (numFormatter.stringFromNumber(commuteTime))! + " minutes"
            let gasNeed = 0
            totalGas.text = (numFormatter.stringFromNumber(gasNeed))! + " gallons"
        }
        
        
        
        
        //-----------
        // Add alert
        //-----------
        if (miles > 50 && carBusBike.selectedSegmentIndex == 0) {
            let alert=UIAlertController(title: "Warning", message: "Maybe you should carpool :)", preferredStyle:
                    UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "Cancel",
                    style:UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction)
                let okAction = UIAlertAction(title: "OK", style:
                    UIAlertActionStyle.Default, handler: { action in
                        //self.people.text="1"
                })
                
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        
        
    }
    
    
    //--------------------
    // Dismisses keyboard
    //--------------------
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalMiles.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

