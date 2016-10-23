//
//  MapViewController.swift
//  ProjectTest
//
//  Created by Tom Alex on 4/14/16.
//  Copyright © 2016 Stevie Dominique de Jaime Magaço. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class MapView: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var MapViewer: MKMapView!
    var Corelocation = CLLocationManager()
    var desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyBest
    var locationManager:LocationManager! = LocationManager.sharedInstance
    var annotaions: [MKPointAnnotation] = [MKPointAnnotation()]
    var locationPinCord: [CLLocationCoordinate2D] = [CLLocationCoordinate2DMake(28.596153, -81.293877)]
    var address = "1 Infinite Loop, CA, USA"
    var geocoder = CLGeocoder()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            Corelocation.delegate = self
            Corelocation.desiredAccuracy = desiredAccuracy
            locationManager = LocationManager.sharedInstance
            MapViewer.showsUserLocation = true
            let authorization = CLLocationManager.authorizationStatus()
            
            if authorization == CLAuthorizationStatus.NotDetermined && Corelocation.respondsToSelector(#selector(CLLocationManager.requestAlwaysAuthorization)) || Corelocation.respondsToSelector(#selector(CLLocationManager.requestWhenInUseAuthorization)){
                if NSBundle.mainBundle().objectForInfoDictionaryKey("NSLocationAlwaysUsageDescription") != nil{
                    Corelocation.requestAlwaysAuthorization()
                }else{
                    print("No description provided")
                }
            }else{

                 getLocation()
            }
            
    }
    func getLocation(){
        locationManager.startUpdatingLocationWithCompletionHandler { (latitude, longitude, status, verboseMessage, error) in
           
            self.DisplayJobPostings()
             self.displayLocation(CLLocation(latitude: latitude, longitude: longitude))
          //  self.displayLocation(self.Corelocation.location!)
           // self.DisplayJobPostings()
            self.locationManager.stopUpdatingLocation()
        }
    }
    func displayLocation(location:CLLocation){
        MapViewer.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), MKCoordinateSpanMake(0.05, 0.05)), animated: true)
        //Making pins
        //let locationPinCoord = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
       // let annotation = MKPointAnnotation()
        //annotation.coordinate = locationPinCoord
        
        //MapViewer.addAnnotation(annotation)
        //MapViewer.showAnnotations([annotation], animated: true)
    }
    func DisplayJobPostings(){
        
        //locationPinCord.append(CLLocationCoordinate2DMake(28.596153, -81.293877))
       // annotaions.append(MKPointAnnotation())
        annotaions[0].coordinate = locationPinCord[0]
        annotaions[0].subtitle = "Contact info : 407-555-5050"
        annotaions[0].title = "Yard work needed \n this is second line"
        //annotaions[0].toggleItalics(self.annotaions[0].title)
        MapViewer.addAnnotation(annotaions[0])
        if (UserData.PostedJobs.count > 0)
        {
           for i in 1 ..< UserData.PostedJobs.count {
            address = UserData.PostedJobs[i].Street + ", " + UserData.PostedJobs[i].City + ", " + UserData.PostedJobs[i].State + ", USA"
            geocoder.geocodeAddressString(address) { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                if placemarks?.count >= 0 {
                    let topResult:CLPlacemark = placemarks![0];
                    let placemark: MKPlacemark = MKPlacemark(placemark: topResult);
                    let TempPoint = MKPointAnnotation()
                    TempPoint.coordinate = placemark.coordinate
                    TempPoint.title = UserData.PostedJobs[i].JobTitle
                    TempPoint.subtitle = UserData.PostedJobs[i].JobDescription
                    self.annotaions.append(TempPoint)
                    self.MapViewer.addAnnotation(TempPoint)
                    self.getLocation()
                    }
            }
        }
        }
        
        MapViewer.showAnnotations(annotaions, animated: true)
    }
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.NotDetermined || status != CLAuthorizationStatus.Denied || status != CLAuthorizationStatus.Restricted{
            if NSBundle.mainBundle().objectForInfoDictionaryKey("NSLocationAlwaysUsageDescription") != nil{
                Corelocation.requestAlwaysAuthorization()
            }
            getLocation()
        }
    }

}

