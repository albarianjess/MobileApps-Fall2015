//
//  ViewController.swift
//  Project2
//
//  Created by Jessie Albarian on 10/18/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
    
    }
    
    
    /*func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        //let string = "myString"
        return NSAttributedString(string: str, attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
    }*/
    
    
    //---------------------------------------------------------------------
    // Do any additional setup after loading the view, typically from a nib
    //---------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Engineering Center", "Physics", "Math"]
    }

    
    
    //-----------------------------------------------
    // Dispose of any resources that can be recreated
    //-----------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //
    // The number of columns of data
    //
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    //
    // The number of rows of data
    //
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    //
    // The data to return for the row and component (column) that's being passed in
    //
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Catpure the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
    }
    
}

