//
//  ViewController.swift
//  Lab4
//
//  Created by Jessie Albarian on 10/6/15.
//  Copyright (c) 2015 jalbarian. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //-----------
    // Variables
    //-----------
    @IBOutlet weak var slider:      UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var snow1: UIImageView!

    
    var delta           = CGPointMake(12, 4)            //12px horizontal, 4px vertical
    var imageRadius     = CGFloat()                     //radius of image
    var timer           = NSTimer()                     //animation timer
    var translation     = CGPointMake(0.0, 0.0)         //translation
    var angle: CGFloat  = 0.0                           //angle for rotation
    

    
    //-----------------------------------
    // Slider function that moves object
    //-----------------------------------
    @IBAction func sliderMove(sender: AnyObject) {
        timer.invalidate()
        changeSliderValue()
    }
    
    //------------
    // Make Clouds
    //------------
    func makeClouds() {
        for (var i : Int = 0; i < 400; i++){
            let imageName = "cloud.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            let randomX = Int(arc4random_uniform(1000))
            let randomY = Int(arc4random_uniform(200))
            imageView.frame = CGRect(x: randomX, y: randomY, width: 100, height: 100)
            view.addSubview(imageView)
        }
    }
    
    
    
    
    //--------------------------
    // Changes position of image
    //--------------------------
    func moveImage() {
       
        if imageView.center.x > view.bounds.size.width-imageRadius ||
            imageView.center.x < imageRadius{
                delta.x = -delta.x
        }
    
        let duration=Double(slider.value)
        UIView.beginAnimations("snow", context: nil)
        UIView.animateWithDuration(duration, animations:
            {self.imageView.transform=CGAffineTransformMakeRotation(self.angle)
                self.imageView.center=CGPointMake(self.imageView.center.x +
                    self.delta.x, self.imageView.center.y + self.delta.y)})
        angle += 0.02
        if angle > CGFloat(2*M_PI) {
            angle=0
        }
        UIView.commitAnimations()
        
        
        

    }
    
    func moveImage2() {
        
        if snow1.center.x > view.bounds.size.width {
                delta.x = -delta.x
        }
        let duration=Double(slider.value)
        UIView.beginAnimations("snow", context: nil)
        UIView.animateWithDuration(duration, animations:
            {self.snow1.transform=CGAffineTransformMakeRotation(self.angle)
                self.snow1.center=CGPointMake(self.snow1.center.x +
                    self.delta.x, self.snow1.center.y + self.delta.y)})
        angle += 0.02
        if angle > CGFloat(2*M_PI) {
            angle=0
        }
        UIView.commitAnimations()
    }
    
    
    
    //------------------------------
    // Updates the timer and label
    // with the current slider value
    //------------------------------
    func changeSliderValue() {
        //shows slider value
        sliderLabel.text=String(format: "%.2f", slider.value)
        //uses NSTimer class
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value),
            target: self, selector: "moveImage", userInfo: nil, repeats: true)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value),
            target: self, selector: "moveImage2", userInfo: nil, repeats: true)

    }
    
    
    
    //-------------------------------
    // Do setup before app is started
    //-------------------------------
    override func viewDidLoad() {
        imageRadius = imageView.frame.size.width/2    //set image radius
        changeSliderValue()
        makeClouds()
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

