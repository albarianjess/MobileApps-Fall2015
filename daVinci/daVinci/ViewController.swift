//
//  ViewController.swift
//  daVinci
//
//  Created by Jessie Albarian on 9/4/15.
//  Copyright (c) 2015 jessalbarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var happyText: UILabel!
    @IBOutlet weak var sadText: UILabel!
    @IBOutlet weak var lazyText: UILabel!
    @IBOutlet weak var adventureText: UILabel!
    @IBOutlet weak var motivatedText: UILabel!
    
    // Changes images and text based on button pressed
    @IBAction func switchImage(sender: UIButton){
        if sender.tag==1 {
            clearText()
            mainImage.image=UIImage(named: "happy.png")
            happyText.text="You're awesome!"
        } else if sender.tag==2 {
            clearText()
            mainImage.image=UIImage(named: "sad.png")
            sadText.text="Don't be sad!"
        } else if sender.tag==3 {
            clearText()
            mainImage.image=UIImage(named: "lazy.png")
            lazyText.text="Stop procrastinating!"
        } else if sender.tag==4 {
            clearText()
            mainImage.image=UIImage(named: "adventure.png")
            adventureText.text="Go kitty go!"
        } else if sender.tag==5 {
            clearText()
            mainImage.image=UIImage(named: "motivated.png")
            motivatedText.text="Dive into those books!"
        }
    }
    
    // Clears the text after each button is pressed
    func clearText(){
        happyText.text = ""
        sadText.text = ""
        lazyText.text = ""
        adventureText.text = ""
        motivatedText.text = ""
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

