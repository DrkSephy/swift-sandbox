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
    
    var gameActive = true;
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
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!

    @IBAction func playAgainPressed(sender: AnyObject) {
        // Reset game variables
        activePlayer = 1;
        gameActive = true;
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0];
        var button : UIButton;
        for var i = 0; i < 9; i++ {
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal);
        }
        gameOverLabel.hidden = true;
        playAgainButton.hidden = true;
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y);
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y);
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == 0 && gameActive == true {
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
                        var labelText = "Noughts has won!";
                        if gameState[combination[0]] == 2 {
                            labelText = "Crosses has won!";
                        }
                    
                    gameOverLabel.text = labelText;
                    // Working around bug to have these elements pop in
                    gameOverLabel.hidden = false;
                    playAgainButton.hidden = false;
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y);
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y);
                    });
                    gameActive = false;
                }
            }
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Making buttons and message appear
        gameOverLabel.hidden = true;
        playAgainButton.hidden = true;
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y);
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {

    }


}

