//
//  ViewController.swift
//  Map Demo
//
//  Created by David Leonard on 3/20/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit
import MapKit // Needed to use map functions

class ViewController: UIViewController, MKMapViewDelegate  {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // New type: CLLocationDegrees: needed to input coordinates
        var latitude: CLLocationDegrees = 40.7;
        var longitude: CLLocationDegrees = -73.9;
        
        // Zoom level
        var latDelta: CLLocationDegrees = 0.01;
        var lonDelta: CLLocationDegrees = 0.01;
        
        // A span is a combination of two changes in degrees
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta);
        
        // New type: CLLocationCoordinate2dD - a pair of coordinates
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude);
        
        // Combine the span and the location
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span);
        
        map.setRegion(region, animated: true);
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

