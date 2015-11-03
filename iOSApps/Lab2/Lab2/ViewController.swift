//
//  ViewController.swift
//  Lab2
//
//  Created by Jessie Albarian on 9/15/15.
//  Copyright (c) 2015 jessalbarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //----------------------------------
    // all variables needed for project
    //----------------------------------
    @IBOutlet weak var beatlesImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var capitalSwitch: UISwitch!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBOutlet weak var fontSizeNumberLabel: UILabel!
    
    
    
    //----------------------------------
    // change font to capitalized or not
    //----------------------------------
    @IBAction func changeFont(sender: UISwitch) {
        updateCaps()
    }
    
    
    
    //---------------------------------------------
    // change picture and text with segment control
    //---------------------------------------------
    @IBAction func changeInfo(sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }

    
    
    //-------------------------------
    // change font size using slider
    //-------------------------------
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize = sender.value
        fontSizeNumberLabel.text = String(format: "%.0f", fontSize)
        let fontSizeCGFloat = CGFloat(fontSize)
        titleLabel.font = UIFont.systemFontOfSize(fontSizeCGFloat)
    }
    
    
    
    //--------------
    // update image
    //--------------
    func updateImage() {
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="Good Morning!"
            beatlesImage.image=UIImage(named: "morning")
        }
        else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="City rooftop."
            beatlesImage.image=UIImage(named: "city")
        }
    }
    
    
    
    //-------------
    // update caps
    //-------------
    func updateCaps() {
        if capitalSwitch.on {
            titleLabel.text=titleLabel.text?.uppercaseString
        } else {
            titleLabel.text=titleLabel.text?.lowercaseString
        }
    }
    
    
    
    //-----------------------
    // accepted orientations
    //-----------------------
    /*override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue) | Int(UIInterfaceOrientationMask.LandscapeLeft.rawValue)
    }*/
    
    
    
    //---------
    // override
    //---------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

