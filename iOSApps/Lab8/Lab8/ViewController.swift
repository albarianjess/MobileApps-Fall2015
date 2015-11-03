//
//  ViewController.swift
//  Lab8
//
//  Created by Jessie Albarian on 10/26/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //----------
    // Variables
    //----------
    @IBOutlet weak var adjLabel: UILabel!
    @IBOutlet weak var petLabel: UILabel!
    var user = MadLib()
    
    //--------------------------------
    // A method that can be unwound to
    //--------------------------------
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        adjLabel.text = user.aLabel
        petLabel.text = user.pLabel
    }
    
    //-----------------------------------------------
    // Do any additional setup after loading the view
    //-----------------------------------------------
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

