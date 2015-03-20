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
        
        // Replace any whitespace with -, in order to properly get data from the site 
        // Cities like San Francisco appear as san-francisco on weather-forecast.com
        var url = NSURL(string: "http://www.weather-forecast.com/locations/" + userCity.text.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest");
        
        // Check URL to make sure it exists
        if url != nil {
            // Create our closure, grab web content
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data, response, error) -> Void in
                
                // Our error handler boolean
                var urlError = false;
                
                // Default weather value
                var weather = "";
                
                // If there was no error when grabbing the content...
                if error == nil {
                    // Get the data
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!;
                    
                    // urlContent(?) means we don't know what type it will be
                    // Grab the content from the HTML that starts with the following string vvvvv
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">");
                    
                    // Get the first matching phrase for what we are interested in
                    if urlContentArray.count > 0 {
                        var weatherArray = urlContentArray[1].componentsSeparatedByString("</span>");
                        weather = weatherArray[0] as String;
                        // Replace html codes with actual degree symbol
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "º");
                        
                        
                    } else {
                        // If we have an error, set our boolean to true
                        urlError = true;
                        
                    }
                } else {
                    urlError = true;
                }
                
                // Signal main queue
                dispatch_async(dispatch_get_main_queue()) {
                    // If we had an error, show it here.
                    if urlError == true {
                        self.showError();
                    } else {
                        // If there was no error, show the forecast!
                        self.resultLabel.text = weather;
                    }
                }
                
            });
            task.resume();
        } else {
            showError();
        }

    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    func showError() {
        resultLabel.text = "Was not able to find weather for " + userCity.text + ". Please try again.";
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

