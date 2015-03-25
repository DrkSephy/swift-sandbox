//
//  ViewController.swift
//  Dragging
//
//  Created by David Leonard on 3/25/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a label programmatically
        // self.view.bounds.width gets how wide the user's screen is
        var label: UILabel = UILabel(frame: CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 50, 200, 100));
        label.text = "Drag Me!";
        label.textAlignment = NSTextAlignment.Center;
        self.view.addSubview(label);
        
        var gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:")); // Recognizes drags
        label.addGestureRecognizer(gesture); // Add gesture to label
        label.userInteractionEnabled = true; // Labels by default are not meant to be interacted with
        
    }
    
    /* Function to handle dragging */
    func wasDragged(gesture: UIPanGestureRecognizer){
        println("Dragged");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

