//
//  ViewController.swift
//  Lab3
//
//  Created by Jessie Albarian on 9/17/15.
//  Copyright (c) 2015 jalbarian. All rights reserved.
//

import UIKit

//added the UITextFieldDelegate
class ViewController: UIViewController, UITextFieldDelegate {

    
    // text boxes
    @IBOutlet weak var checkAmount: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    @IBOutlet weak var people: UITextField!
    // empty labels
    @IBOutlet weak var tipDue: UILabel!
    @IBOutlet weak var totalDue: UILabel!
    @IBOutlet weak var totalDuePerPerson: UILabel!
    
    // ADD part that puts keyboard away when background is pressed
    // puts keyboard away when return key is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // Main function
    func updateTipTotals() {
        
        let amount = (checkAmount.text as NSString).floatValue      //casts string to float
        let pct = (tipPercent.text as NSString).floatValue/100      //casts string to float / 100
        let numberOfPeople = people.text.toInt()                    //casts string to int ; returns an optional
        let tip = amount * pct              // calculate tip
        let total = amount + tip            // calculates total bill
        var personTotal : Float = 0.0       // initializes personTotal to 0; needs to be float (Without float, swift thinks its a double)
        
        
        if numberOfPeople != nil {                              // if numberOfPeople is not nil (NULL)...
            if numberOfPeople! > 0 {                            // then if numberOfPeople is greater than 0... (the ! is an 'optional')
                personTotal = total / Float(numberOfPeople!)    // get person total
            } else {                                            // if numberOfPeople if not greater than 0... send an alert
                
                let alert=UIAlertController(title: "Warning", message: "The number of people must be greater than 0", preferredStyle:
                    UIAlertControllerStyle.Alert)                                   //create a UIAlertController object
                let cancelAction = UIAlertAction(title: "Cancel",                   //create a UIAlertAction object for the button
                    style:UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction)
                let okAction = UIAlertAction(title: "OK", style:                    //adds the alert action to the alert object
                    UIAlertActionStyle.Default, handler: { action in
                        self.people.text="1"
                        self.updateTipTotals()
                })
                
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        
        var currencyFormatter           = NSNumberFormatter()                         // initializes
        currencyFormatter.numberStyle   = NSNumberFormatterStyle.CurrencyStyle  // sets to currency style ($$$)
        
        // sets number labels back to strings (these are the empty labels from the beginning)
        tipDue.text             = currencyFormatter.stringFromNumber(tip)
        totalDue.text           = currencyFormatter.stringFromNumber(total)
        totalDuePerPerson.text  = currencyFormatter.stringFromNumber(personTotal)
        }
    
    
    
    
    func tipLow(){
        let amount = (checkAmount.text as NSString).floatValue      //casts string to float
        let pct = (tipPercent.text as NSString).floatValue/100      //casts string to float / 100
        let numberOfPeople = people.text.toInt()                    //casts string to int ; returns an optional
        let tip = amount * pct              // calculate tip
        let total = amount + tip            // calculates total bill
        var personTotal : Float = 0.0       // initializes personTotal to 0; needs to be float (Without float, swift thinks its a double)
    if tipPercent != nil {
        if tip < 15 && tip >= 0 {
            let tipAlert=UIAlertController(title: "Warning", message: "Your tip is low!!", preferredStyle:
                UIAlertControllerStyle.Alert)                                   //create a UIAlertController object
            let cancelAction = UIAlertAction(title: "Cancel",                   //create a UIAlertAction object for the button
                style:UIAlertActionStyle.Cancel, handler: nil)
            tipAlert.addAction(cancelAction)
            let okAction = UIAlertAction(title: "OK", style:                    //adds the alert action to the alert object
                UIAlertActionStyle.Default, handler: { action in
                    self.people.text="1"
                    self.updateTipTotals()
                })
    
            tipAlert.addAction(okAction)
            presentViewController(tipAlert, animated: true, completion: nil)
            }
        }
    }

    
    // UITextFieldDelegate has this method
    func textFieldDidEndEditing(textField: UITextField) {
        updateTipTotals()
        tipLow()
    }
    
    // set up before app runs
    override func viewDidLoad() {
        checkAmount.delegate=self
        tipPercent.delegate=self
        people.delegate=self
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

