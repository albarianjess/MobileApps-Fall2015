//
//  SecondViewController.swift
//  Lab8
//
//  Created by Jessie Albarian on 10/26/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    //----------
    // Variables
    //----------
    @IBOutlet weak var adjField: UITextField!
    @IBOutlet weak var petField: UITextField!
    
    //-----------------
    // Dismiss keyboard
    //-----------------
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //--------------------
    // Adds text to labels
    //--------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "doneStuff"{
            var SecondViewController:ViewController =
            segue.destinationViewController as! ViewController
            if adjField.text.isEmpty == false{
                SecondViewController.user.aLabel = adjField.text
            }
            if adjField.text.isEmpty == false{
                SecondViewController.user.pLabel = petField.text
            }
        }
    }
    
    //-----------------------------------------------
    // Do any additional setup after loading the view
    //-----------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        adjField.delegate = self
        petField.delegate = self
    }
    
    //-----------------------------------------------
    // Dispose of any resources that can be recreated
    //-----------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
