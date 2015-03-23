//
//  ViewController.swift
//  Shake and Swipe
//
//  Created by David Leonard on 3/21/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer();
    // Array of sound effects
    var sounds = ["get_coin", "jump", "shoot", "death"];
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:");
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right;
        self.view.addGestureRecognizer(swipeRight);
    }
    */
    
    /* Method for detecting shakes */
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if event.subtype == UIEventSubtype.MotionShake {
            
            // Generate random number
            var randomNumber = Int(arc4random_uniform(UInt32(sounds.count)));
            println(randomNumber);
            
            
            // Play a single sound
            var fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3");
            var error: NSError? = nil;
            
            player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!), error: &error);
            player.play();
        }
    }
    
    /* Method for detecting swipes */
    /*
    func swiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                println("User swiped right");
            default:
                break;
            }
        }
    }
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

