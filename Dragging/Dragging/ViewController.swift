//
//  ViewController.swift
//  Dragging
//
//  Created by David Leonard on 3/25/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var xFromCenter:CGFloat = 0; // How far did we translate an object?
    
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
        let translation = gesture.translationInView(self.view); // Create a translation for the drag
        var label = gesture.view!
        
        xFromCenter += translation.x; // Increase our distance from center as we move the label
        var scale = min(100 / abs(xFromCenter), 1); // Minimize the scale of minimization
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y);
        gesture.setTranslation(CGPointZero, inView: self.view);
        // Implement rotation based on how far user has dragged
        var rotation:CGAffineTransform = CGAffineTransformMakeRotation(xFromCenter / 200);
        // As xFromCenter gets bigger, we want to shrink the label proportionally
        var stretch: CGAffineTransform = CGAffineTransformScale(rotation, scale, scale);
        label.transform = stretch;
        
        if label.center.x < 100 {
            println("Not Chosen");
        } else if label.center.x > self.view.bounds.width - 100 {
            println("Chosen");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

