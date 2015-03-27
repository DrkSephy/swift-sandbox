//
//  GameScene.swift
//  Flappy Bird
//
//  Created by David Leonard on 3/26/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var bird = SKSpriteNode(); // An entity in our game

    override func didMoveToView(view: SKView) {
        var birdTexture = SKTexture(imageNamed: "img/flappy1.png"); // Assign an image to bird
        bird = SKSpriteNode(texture: birdTexture); // Add the texture
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame)); // Set position
        self.addChild(bird);
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
