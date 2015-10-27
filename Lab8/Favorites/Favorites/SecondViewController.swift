//
//  SecondViewController.swift
//  Favorites
//
//  Created by Jessie Albarian on 10/18/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    //----------
    // Variables
    //----------
    @IBOutlet weak var userBook: UITextField!
    @IBOutlet weak var userAuthor: UITextField!
    
    
    
    //-------------------
    // Puts keyboard away
    //-------------------
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    //
    // fds
    //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "doneFavs"{
            var SecondViewController:ViewController =
            segue.destinationViewController as! ViewController
            //check to see that text was entered in the textfields
            if userBook.text.isEmpty == false{
                SecondViewController.user.favBook = userBook.text
            }
            if userAuthor.text.isEmpty == false{
                SecondViewController.user.favAuthor = userAuthor.text
            }
        }
    }
    
    
    
    //-----------------------------------------------
    // Do any additional setup after loading the view.
    //-----------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        userBook.delegate=self
        userAuthor.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
