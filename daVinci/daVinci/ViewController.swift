//
//  ViewController.swift
//  daVinci
//
//  Created by Jessie Albarian on 9/1/15.
//  Copyright (c) 2015 jessalbarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showImage: UIImageView!
   

   /* @IBAction func chooseArt(sender: UIButton) {
        if (sender.tag==1){
            showImage.image=UIImage(named: "kitten2.jpg")
        } else if (sender.tag==2){
            showImage.image = UIImage(named: "kitten3.jpg")
        }
    }*/
    

    @IBAction func changePic(sender: UIButton) {
        if (sender.tag==1){
            showImage.image=UIImage(named: "attackKitty.jpg")
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

