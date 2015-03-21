//
//  ViewController.swift
//  Map Demo
//
//  Created by David Leonard on 3/20/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit
import MapKit // Needed to use map functions
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest; // Use the GPS
        locationManager.requestWhenInUseAuthorization(); // Only request access whenever the app is running
        locationManager.startUpdatingLocation(); // Start accessing the user's location when allowed, and let us know whenever this changes
        
        
        // New type: CLLocationDegrees: needed to input coordinates
        var latitude: CLLocationDegrees = 43.095181;
        var longitude: CLLocationDegrees = -79.006424;
        
        // Zoom level
        var latDelta: CLLocationDegrees = 0.05;
        var lonDelta: CLLocationDegrees = 0.05;
        
        // A span is a combination of two changes in degrees
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta);
        
        // New type: CLLocationCoordinate2dD - a pair of coordinates
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude);
        
        // Combine the span and the location
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span);
        
        map.setRegion(region, animated: true);
        
        // Adding annotations
        var annotation = MKPointAnnotation();
        
        annotation.coordinate = location;
        annotation.title = "Niagra Falls";
        annotation.subtitle = "One day I'll go here..."
        map.addAnnotation(annotation);
        
        // Create long press gesture recognizer to add a pin
        // The colon at the end of action is to send the information that is sent when we do the long press
        var longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "action:");
        longPressRecognizer.minimumPressDuration = 2;
        map.addGestureRecognizer(longPressRecognizer);
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations);
        
        var userLocation: CLLocation = locations[0] as CLLocation;
        var latitude = userLocation.coordinate.latitude;
        var longitude = userLocation.coordinate.longitude;
        
        // Zoom level
        var latDelta: CLLocationDegrees = 0.05;
        var lonDelta: CLLocationDegrees = 0.05;
        
        // A span is a combination of two changes in degrees
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta);
        
        // New type: CLLocationCoordinate2dD - a pair of coordinates
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude);
        
        // Combine the span and the location
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span);
        
        self.map.setRegion(region, animated: false);
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        println("Gesture recognized");
        // Location where the user has done the long press in terms of the screen position
        var touchPoint = gestureRecognizer.locationInView(self.map);
        var newCoordinate : CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map);
        
        // Adding annotations
        var annotation = MKPointAnnotation();
        
        annotation.coordinate = newCoordinate;
        annotation.title = "New Place";
        annotation.subtitle = "One day I'll go here..."
        map.addAnnotation(annotation);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

