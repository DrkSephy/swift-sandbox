//
//  ViewController.swift
//  Metallica
//
//  Created by David Leonard on 3/21/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer();
    @IBAction func play(sender: AnyObject) {
        player.play();
    }
    
    
    @IBAction func stop(sender: AnyObject) {
        // Stop the song
        player.stop();
        
        // Reset the time
        player.currentTime = 0;
    }
    @IBAction func sliderChanged(sender: AnyObject) {
        player.volume = sliderValue.value;
    }
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBAction func pause(sender: AnyObject) {
        // Pause the song
        player.pause();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var audioPath = NSBundle.mainBundle().pathForResource("masterofpuppets", ofType: "mp3");
        var error:NSError? = nil;
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath!), error: &error);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

