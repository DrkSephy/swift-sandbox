//
//  SignUpViewController.swift
//  tinder
//
//  Created by David Leonard on 3/25/15.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    
    
    @IBOutlet weak var genderSwitch: UISwitch!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    
    @IBAction func signUp(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /* Get User's Facebook Profile Picture */
        var FBSession = PFFacebookUtils.session();
        var accessToken = FBSession.accessTokenData.accessToken;
        let url = NSURL(string: "https://graph.facebook.com/me/picture?type=large&return_ssl_resources=1&access_token="+accessToken); // Get Facebook profile picture
        let urlRequest = NSURLRequest(URL: url!);
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response, data, error in
            let image = UIImage(data: data);
            self.profilePic.image = image;
            var user = PFUser.currentUser();
            user["image"] = data;
            user.saveInBackground();
        });
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
