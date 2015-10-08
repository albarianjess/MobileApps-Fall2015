//
//  ViewController.swift
//  Lab5
//
//  Created by Jessie Albarian on 10/8/15.
//  Copyright (c) 2015 jalbarian. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate {

    //----------
    // Variables
    //----------
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()

    
    
    //--------------------------------------------
    // Called when a location cannot be determined
    //--------------------------------------------
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        var errorType = String()
        if let clError = CLError(rawValue: error.code)
        {
            if (clError == .Denied)
            {
                errorType = "access denied"
                let alert = UIAlertController(title: "Error", message: errorType, preferredStyle: UIAlertControllerStyle.Alert)
                let okAction:UIAlertAction = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    
    //----------------------------------------------
    // Called when a new location value is available
    //----------------------------------------------
    func locationManager (manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(manager.location.coordinate, span)
        mapView.setRegion(region, animated:true)
        annotation.coordinate   = manager.location.coordinate
        annotation.title        = "You are here"
        annotation.subtitle     = "Lat: \(manager.location.coordinate.latitude) Long: \(manager.location.coordinate.latitude)"
        mapView.addAnnotation(annotation)
    }
    
    
    
    //--------------------------------------
    // Called when the authorization status
    // for the application changed
    //--------------------------------------
    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus){
        println("didchangeauth")
        if status==CLAuthorizationStatus.AuthorizedWhenInUse
        {
            locationManager.startUpdatingLocation()
        }
    }
    
            
    
    //----------------------------
    // Setup stuff before app runs
    //----------------------------
    override func viewDidLoad() {
        mapView.mapType = MKMapType.Standard
        var status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if (status == CLAuthorizationStatus.NotDetermined)
        {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate        = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter  = kCLDistanceFilterNone
        mapView.showsUserLocation       = true
        super.viewDidLoad()
    }
    
    
    
    //-----------------------------------------------
    // Dispose of any resources that can be recreated.
    //-----------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}