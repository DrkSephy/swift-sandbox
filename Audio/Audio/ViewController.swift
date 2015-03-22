//
//  ViewController.swift
//  Audio
//
//  Created by David Leonard on 3/21/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer();
    @IBAction func play(sender: AnyObject) {
        // NSBundle is a way to access the file structure of the app
        var audioPath = NSBundle.mainBundle().pathForResource("explore.mp3", ofType: "mp3")!;
        var error : NSError? = nil;
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        if error == nil {
            player.play();
        } else {
            println(error);
        }
    }
    
    
    @IBAction func pause(sender: AnyObject) {
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
    }
    
    
    @IBOutlet weak var sliderValue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

