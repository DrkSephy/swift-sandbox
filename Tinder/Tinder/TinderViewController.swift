//
//  TinderViewController.swift
//  tinder
//
//  Created by David Leonard on 3/26/15.
//  Copyright (c) 2015 DrkSephy. All rights reserved.
//

import UIKit

class TinderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("hello");
        // Get user's location whenever they use the app
        PFGeoPoint.geoPointForCurrentLocationInBackground { (geopoint: PFGeoPoint!, error: NSError!) -> Void in
            if error == nil {
                println(geopoint);
            } else {
                println(error);
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
