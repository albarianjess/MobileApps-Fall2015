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
    
    @IBAction func switchImage(sender: UIButton){
        if sender.tag==1 {
            mainImage.image=UIImage(named: "happy.png")
            happyText.text="You're awesome!"
        } else if sender.tag==2 {
            mainImage.image=UIImage(named: "sad.png")
            sadText.text="Don't be sad!"
        } else if sender.tag==3 {
            mainImage.image=UIImage(named: "lazy.png")
            lazyText.text="Stop procrastinating!"
        } else if sender.tag==4 {
            mainImage.image=UIImage(named: "adventure.png")
            adventureText.text="Go kitty go!"
        } else if sender.tag==5 {
            mainImage.image=UIImage(named: "motivated.png")
            motivatedText.text="Dive into those books!"
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

