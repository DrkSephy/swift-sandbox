//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by David Leonard on 3/20/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = O, 2 = X
    var activePlayer = 1;
    
    // State of the board
    // 0 = empty
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    
    // Winning conditions
    // [0, 1, 2]: top line
    // [3, 4, 5]: middle horizontal line
    // [6, 7, 8]: bottom horizontal line
    // ...
    // ...
    var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];
    
    @IBOutlet weak var button: UIButton!

    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == 0 {
            var image = UIImage();
            gameState[sender.tag] = activePlayer;
            if activePlayer == 1 {
                image = UIImage(named: "nought.png")!;
                activePlayer = 2;
            } else {
                image = UIImage(named: "cross.png")!;
                activePlayer = 1;
            }
            // Display image for normal state
            // We use sender to indicate the UI element that was tapped
            sender.setImage(image, forState: .Normal);
            // Loop through winning combinations
            for combination in winningCombinations {
                // Manual check for a winner on the top row
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    println("We have a winner!");
                }
            }
        }

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

