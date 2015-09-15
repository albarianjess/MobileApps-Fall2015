//
//  ViewController.swift
//  Lab2
//
//  Created by Jessie Albarian on 9/15/15.
//  Copyright (c) 2015 jessalbarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beatlesImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBOutlet weak var capitalSwitch: UISwitch!
   
    
    @IBAction func changeFont(sender: UISwitch) {
        if capitalSwitch.on {
            titleLabel.text=titleLabel.text?.uppercaseString
        } else {
            titleLabel.text=titleLabel.text?.lowercaseString
        }
    }
    
    @IBAction func changeInfo(sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="Good Morning!"
            beatlesImage.image=UIImage(named: "morning")
        }
        else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="City rooftop."
            beatlesImage.image=UIImage(named: "city")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

