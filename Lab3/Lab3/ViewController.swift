//
//  ViewController.swift
//  Lab3
//
//  Created by Jessie Albarian on 9/24/15.
//  Copyright (c) 2015 jalbarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    
    //---------------
    // Main Variables
    //---------------
    @IBOutlet weak var celciusText: UITextField!
    @IBOutlet weak var fText: UILabel!
    
    @IBOutlet weak var fahText: UITextField!
    @IBOutlet weak var cText: UILabel!
    
    
    
    //--------------------
    // Dismisses keyboard
    //--------------------
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    //----------------------------
    // Temperature conversion
    //----------------------------
    func calculation(){
        
        //if celsius text field is chosen, do this
        //if fahren text field is chosen, do this
        var numFormatter = NSNumberFormatter()
        numFormatter.numberStyle=NSNumberFormatterStyle.NoStyle
        
        
        if (fahText.text.isEmpty) {
            let celc = (celciusText.text as NSString).floatValue
            let fahren = celc * (9/5) + 32
            fText.text = numFormatter.stringFromNumber(fahren)
            clearText()
        } else if (celciusText.text.isEmpty){
            let far = (fahText.text as NSString).floatValue
            let celsi = (far - 32) * (5/9)
            cText.text = numFormatter.stringFromNumber(celsi)
            clearText()
        }
    }
    
    
    
    //---------------------------------
    // Clear text after each conversion
    //---------------------------------
    func clearText(){
        celciusText.text = ""
        fahText.text = ""
    }
    
    
    
    //------------------------------------------
    // Calls function after textfield is entered
    //------------------------------------------
    func textFieldDidEndEditing(textField: UITextField) {
        calculation()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        celciusText.delegate = self
        fahText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

