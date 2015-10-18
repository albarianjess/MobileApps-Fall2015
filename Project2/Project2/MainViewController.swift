//
//  MainViewController.swift
//  Project2
//
//  Created by Jessie Albarian on 10/17/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var picker: UIPickerView!
    //private var mapViewController: MapViewController!
    var pickerData: [String] = [String]()
    
    
    
    @IBAction func switchViews(sender: UIPickerView){
        
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    

    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Catpure the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }
    
    }
    //-----------------------------------------------
    // Do any additional setup after loading the view
    //-----------------------------------------------
     func viewDidLoad() {
        
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["Math Building", "Computer Science Building", "Physics Building"]
        super.viewDidLoad()
    }

    
    
    //-----------------------------------------------
    // Dispose of any resources that can be recreated
    //-----------------------------------------------
     func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

