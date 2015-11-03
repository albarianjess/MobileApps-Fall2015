//
//  SecondViewController.swift
//  Midterm
//
//  Created by Jessie Albarian on 10/29/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    //----------
    // Variables
    //----------
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    
    //-----------------
    // Dismiss Keyboard
    //-----------------
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
