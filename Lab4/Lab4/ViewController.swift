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
    @IBOutlet weak var mainImage:   UIImageView!
    
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
    
    func makeSnow() {
        
        for i in 0...100 {
            let snow = UIView()
            snow.frame = CGRect(x: 55, y: 300, width: 20, height: 20)   //set frame for image
            snow.layer.cornerRadius = snow.frame.size.height/2;         //make image circular
            snow.backgroundColor = UIColor.whiteColor()                 //white!
            self.view.addSubview(snow)                                  //add to view
            
            // randomly create a value between 0.0 and 150.0
            let randomYOffset = CGFloat( arc4random_uniform(1000))
            let randomX = CGFloat(arc4random_uniform(1000))
            
            // for every y-value on the bezier curve
            // add our random y offset so that each individual animation
            // will appear at a different y-position
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: randomX, y: 0 ))
            path.addCurveToPoint(CGPoint(x: randomX, y: randomYOffset), controlPoint1: CGPoint(x: randomX, y: randomYOffset), controlPoint2: CGPoint(x: randomX, y: randomYOffset))
            
            // create the animation
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            anim.duration = 5.0
            
            // add the animation 
            snow.layer.addAnimation(anim, forKey: "animate position along path")
            // each square will take between 4.0 and 8.0 seconds
            // to complete one animation loop
            anim.duration = Double(arc4random_uniform(400)+30) / 10
            
            // stagger each animation by a random value
            // `290` was chosen simply by experimentation
            anim.timeOffset = Double(arc4random_uniform(290))
        }
    }
    
    //----------------------
    // Function to make snow
    //----------------------
   /* func makeSnow() {
        for var i = 0; i <= 50; ++i {
            let randNum = Int(arc4random_uniform(1000))
            let imageName = "blue.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x:randNum, y:-100, width: 100, height: 100)
            view.addSubview(imageView)
        }
    }*/
    
    
    
    //--------------------------
    // Changes position of image
    //--------------------------
    func moveImage() {
        
        let duration = Double(slider.value)
        
        let snow = UIView()
        snow.frame = CGRect(x: 55, y: 300, width: 20, height: 20)   //set frame for image
        snow.layer.cornerRadius = snow.frame.size.height/2;         //make image circular
        snow.backgroundColor = UIColor.whiteColor()                 //white!
        self.view.addSubview(snow)                                  //add to view
        
        
        UIView.beginAnimations("snow", context: nil)
        UIView.animateWithDuration(duration, animations:
            {snow.transform=CGAffineTransformMakeTranslation(self.translation.x
                , self.translation.y)
                self.translation.x += self.delta.x
                self.translation.y += self.delta.y
                //sets transform to CGAffineTransform)
            })
        UIView.commitAnimations()
    
        snow.center=CGPointMake(snow.center.x + delta.x, snow.center.y + delta.y)
        
        if snow.center.x + translation.x > self.view.bounds.size.width-imageRadius
            || snow.center.x + translation.x < imageRadius{
                delta.x = -delta.x
        }
        //Taking this out allows the images to disappear at the bottom of the screen
        /*if mainImage.center.y + translation.y > self.view.bounds.size.height
            - ballRadius || mainImage.center.y + translation.y < ballRadius {
                delta.y = -delta.y
        }*/
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
    }
    
    
    
    //-------------------------------
    // Do setup before app is started
    //-------------------------------
    override func viewDidLoad() {
        imageRadius = mainImage.frame.size.width/2    //set image radius
        changeSliderValue()
        //makeSnow()
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

