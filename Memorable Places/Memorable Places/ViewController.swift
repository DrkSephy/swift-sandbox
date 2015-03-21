//
//  ViewController.swift
//  Memorable Places
//
//  Created by David Leonard on 3/21/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var manager: CLLocationManager!
    
    @IBOutlet weak var map: MKMapView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager();
        manager.delegate = self;
        manager.desiredAccuracy = kCLLocationAccuracyBest;
        manager.requestWhenInUseAuthorization();
        manager.startUpdatingLocation();
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation: CLLocation = locations[0] as CLLocation;
        var latitude = userLocation.coordinate.latitude;
        var longitude = userLocation.coordinate.longitude;
        var coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        var latDelta: CLLocationDegrees = 0.01;
        var lonDelta: CLLocationDegrees = 0.01;
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta);
        var region: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span);
        self.map.setRegion(region, animated: true);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

