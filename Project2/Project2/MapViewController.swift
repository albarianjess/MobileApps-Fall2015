//
//  MapViewController.swift
//  Project2
//
//  Created by Jessie Albarian on 10/18/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    //----------------------
    // Variables and Objects
    //----------------------
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    let viewC = ViewController()

    
    
    //---------------------------------------------------------------------
    // Do any additional setup after loading the view, typically from a nib
    //---------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocationCoordinate2D(
        latitude: 40.007581,
        longitude: -105.265942
        )
        
        //mapView.mapType=MKMapType.Hybrid //hybrid with map and satellite
        var status:CLAuthorizationStatus =
        CLLocationManager.authorizationStatus()
        if status==CLAuthorizationStatus.NotDetermined {
            locationManager.requestWhenInUseAuthorization() //ios8 and later only
        }
        let span = MKCoordinateSpanMake(0.03, 0.03) //defines the area spanned by a map region
        //let region = MKCoordinateRegion(center: location, span: span)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true) //animates changing the currently visible region
        
        
        /*let annotation = MKPointAnnotation() //create an annotation
        annotation.coordinate=location //sets the coordinates of the annotation
        annotation.title="Empire State Building" //sets the title of the annotation
        annotation.subtitle="New York" //sets the subtitle of the annotation
        mapView.addAnnotation(annotation) //adds the annotation to the map view
        */
}
    

    
   /* func changeMap(){
        viewC.pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
        
        if row == 0 {
            
        } else if row == 1 {
            
        } else {
            
        }
    }*/
    
    //
    // if 'get current location' button is pressed, then override location variable and add
    /*locationManager.delegate=self
    locationManager.desiredAccuracy=kCLLocationAccuracyBest //specify the desired accuracy
    locationManager.distanceFilter=kCLDistanceFilterNone //specify the distance a device must move laterally(in meters) to generate an update. We specify to be notified of all movements
    mapView.showsUserLocation=true*/



    //-----------------------------------------------------------------
    // Called when the authorization status for the application changed
    //-----------------------------------------------------------------
    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            println("didchangeauth")
            if status==CLAuthorizationStatus.AuthorizedWhenInUse {
                locationManager.startUpdatingLocation() //starts the location
                manager
            }
    }
   
    
    
    //--------------------------------------------
    // Called when a location cannot be determined
    //--------------------------------------------
    func locationManager(manager: CLLocationManager!, didFailWithError
        error: NSError!) {
            var errorType=String()
            if let clError=CLError(rawValue: error.code) {
                if clError == .Denied {
                    errorType="access denied"
                    let alert=UIAlertController(title: "Error", message:
                        errorType, preferredStyle: UIAlertControllerStyle.Alert)
                    let okAction:UIAlertAction=UIAlertAction(title: "OK",
                        style:UIAlertActionStyle.Default, handler: nil)
                    alert.addAction(okAction)
                    presentViewController(alert, animated: true, completion:
                        nil)
                }
            }
    }
    
    
    
    //----------------------------------------------
    // Called when a new location value is available
    //----------------------------------------------
    /*func locationManager(manager: CLLocationManager!, didUpdateLocations
        locations: [AnyObject]!){
        let span = MKCoordinateSpanMake(0.9, 0.9) //defines the area spanned by a map region
        //let region = MKCoordinateRegion(center: location, span: span)
        let region = MKCoordinateRegionMake(manager.location.coordinate, span)
        mapView.setRegion(region, animated: true) //animates changing the currently visible region
    }*/
    
    
    
    //-----------------------------------------------
    // Dispose of any resources that can be recreated
    //-----------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
