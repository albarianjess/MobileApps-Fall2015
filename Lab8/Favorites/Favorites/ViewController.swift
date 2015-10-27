//
//  ViewController.swift
//  Favorites
//
//  Created by Jessie Albarian on 10/18/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //----------------------
    // Variables and objects
    //----------------------
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    var user = Favorite()
    
    
    
    //--------------------------------------
    // Update labels according to user input
    //--------------------------------------
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        bookLabel.text = user.favBook
        authorLabel.text = user.favAuthor
    }
    
    
    
    //---------------------------------------------------------------------
    // Do any additional setup after loading the view, typically from a nib
    //---------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    //-----------------------------------------------
    // Dispose of any resources that can be recreated
    //-----------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

