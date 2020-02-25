//
//  ViewController.swift
//  WhereWasI
//
//  Created by TANER DÜZCEER on 24.02.2020.
//  Copyright © 2020 TanerMan. All rights reserved.
//

import UIKit
import MapKit

// CLLocationManagerDelegate has map functions and classes
class ViewController: UIViewController, CLLocationManagerDelegate {
    // Info.plist file we did some changes for required location permission gps
    @IBOutlet weak var mapView: MKMapView!
    
    //When the button clicked save the location
    @IBAction func SaveButtonClicked(_ sender: Any)
    {
        //? means get location if it is not null
        let coordinate = locationManager.location?.coordinate
        
        if let latitute = coordinate?.latitude
        {
           if let longitute = coordinate?.longitude
            {
                DataStore().StoreDataPoint(latitute: String(latitute), longitute: String(longitute))
                UpdateSavedPin()
            }
        }
        
    }
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //It request location permission and show message in Info.plist
        locationManager.startUpdatingLocation()
        
        UpdateSavedPin()
    }
    
    //This method moves the old location to current location
    func UpdateSavedPin()
    {
        if let oldCoordinates : VisitedPoint = DataStore().GetLastLocation()
               {
                   let annotationRemove = mapView.annotations.filter{ $0 !== mapView.userLocation }
                   mapView.removeAnnotations(annotationRemove)
                
                   let annotation = MKPointAnnotation()
                   annotation.coordinate.latitude = Double(oldCoordinates.latitude)!
                   annotation.coordinate.longitude = Double(oldCoordinates.longitute)!
               
                   annotation.title = "I was here!"
                   annotation.subtitle = "Remember?"
                   mapView.addAnnotation(annotation)
               }
    }
    
    //When the location permission has changed this method executes
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        //guard  means fire this method when location is permitted like if else
        guard status == .authorizedWhenInUse
        else
        {
            print("Location is not enabled")
            return
        }
        print("Location allowed")
        //we can do that in storyboard too
        mapView.showsUserLocation = true
    }


}

