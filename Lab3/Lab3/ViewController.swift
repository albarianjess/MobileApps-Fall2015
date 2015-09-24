//
//  ViewController.swift
//  Lab3
//
//  Created by Jessie Albarian on 9/24/15.
//  Copyright (c) 2015 jalbarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var celciusText: UITextField!
    @IBOutlet weak var fText: UILabel!
    
    
    
    //--------------------
    // Dismisses keyboard
    //--------------------
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    //----------------------------
    // Does temperature conversion
    //----------------------------
    func calculation(){
        
        //if celsius text field is chosen, do this
        //if fahren text field is chosen, do this
        
        let celc = (celciusText.text as NSString).floatValue
        let fahren = celc * (9/5) + 32
    
        var numFormatter = NSNumberFormatter()
        numFormatter.numberStyle=NSNumberFormatterStyle.NoStyle
        fText.text = numFormatter.stringFromNumber(fahren)
    }
    
    
    
    //------------------------------------------
    // Calls function after textfield is entered
    //------------------------------------------
    func textFieldDidEndEditing(textField: UITextField) {
        calculation()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        celciusText.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

