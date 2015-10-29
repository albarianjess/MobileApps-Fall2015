//
//  ViewController.swift
//  Midterm1
//
//  Created by Jessie Albarian on 10/27/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    //----------
    // Variables
    //----------
    @IBOutlet weak var roundTripMiles: UITextField!
    @IBOutlet weak var time: UILabel!

    
    
    
    //-----------------
    // Main calculation
    //-----------------
    func calculation(){
        var numFormatter = NSNumberFormatter()
        numFormatter.numberStyle=NSNumberFormatterStyle.NoStyle

        let miles = (roundTripMiles.text as NSString).floatValue
        let commuteTime = miles/(20)
        time.text = numFormatter.stringFromNumber(commuteTime)
        //clearText()
        //return commuteTime
        
    }



    //------------------------------------------
    // Calls function after textfield is entered
    //------------------------------------------
    func textFieldDidEndEditing(textField: UITextField) {
        calculation()
    }



    //-------------------
    // Dismisses keyboard
    //-------------------
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundTripMiles.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

