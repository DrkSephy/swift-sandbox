//
//  ViewController.swift
//  Storing Images
//
//  Created by David Leonard on 3/22/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var madara: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://img2.wikia.nocookie.net/__cb20150117104551/naruto/images/thumb/c/cf/Madara_newshot.png/300px-Madara_newshot.png")!;
        
        let urlRequest = NSURLRequest(URL: url);
        
        // Try to connect to a URL...
        // Send an asynchronous request
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
           // Grab three variables
            response, data, error in
            
            if error != nil {
                println("There was an error");
            } else {
                // Pass the data returned from the successful request
                let image = UIImage(data: data);
                // self.madara.image = image;
                
                // Save file we downloaded, and then set the image
                // Prevents the user from having to download the image each time
                var documentsDirectory: String?;
                // Will return an array of the paths of the folders that we can store our documents in
                var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true);
                
                if paths.count > 0 {
                    documentsDirectory = paths[0] as? String;
                    var savePath = documentsDirectory! + "/madara,jpg";
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil); // Save the image 
                    self.madara.image = UIImage(named: savePath);
                }
            }
        });
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

