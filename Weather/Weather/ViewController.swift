//
//  ViewController.swift
//  Weather
//
//  Created by David Leonard on 3/19/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userCity: UITextField!
    
    @IBAction func findWeather(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    func showError() {
        resultLabel.text = "Was not able to find weather for " + userCity.text + ". Please try again.";
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var url = NSURL(string: "http://www.weather-forecast.com/locations/London/forecasts/latest");
        // Check URL to make sure it exists
        if url != nil {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data, response, error) -> Void in
                var urlError = false;
                if error == nil {
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding);
                    println(urlContent);
                } else {
                    urlError = true;
                }
                
                if urlError == true {
                    self.showError();
                }
            
            });
            task.resume();
        } else {
            showError();
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

