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
    var bg = SKSpriteNode();

    override func didMoveToView(view: SKView) {
        var birdTexture = SKTexture(imageNamed: "img/flappy1.png"); // Assign an image to bird
        var birdTexture2 = SKTexture(imageNamed: "img/flappy2.png"); // Second frame
        
        // Create animation
        var animation = SKAction.animateWithTextures([birdTexture, birdTexture2], timePerFrame: 0.1);
        var makeBirdFlap = SKAction.repeatActionForever(animation);
        
        // Display background
        var bgTexture = SKTexture(imageNamed: "img/bg.png");
        // Make the background move
        var movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9);
        var replacebg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0);
        var movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg])); // Make background repeat forever
        
        for var i: CGFloat = 0; i < 3; i++ {
            bg = SKSpriteNode(texture: bgTexture);
            bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i, y: CGRectGetMidY(self.frame));
            bg.size.height = self.frame.height;

            bg.runAction(movebgForever);
            self.addChild(bg);
            
            
        }
        bird = SKSpriteNode(texture: birdTexture); // Add the texture
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame)); // Set position
        bird.runAction(makeBirdFlap); // Apply the animation
        // Setup bird physics
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height / 2);
        bird.physicsBody?.dynamic = true;
        // Disable bird from rotating
        bird.physicsBody?.allowsRotation = false
        self.addChild(bird);
        
        var ground = SKNode();
        ground.position = CGPointMake(0, 0);
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1));
        ground.physicsBody?.dynamic = false
        
        self.addChild(ground);
        
        // Create pipe 1
        var pipe1Texture = SKTexture(imageNamed: "img/pipe1.png");
        var pipe1 = SKSpriteNode(texture: pipe1Texture);
        pipe1.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) + 1000);
        
        self.addChild(pipe1);
        
        // Create pipe 2
        var pipe2Texture = SKTexture(imageNamed: "img/pipe2.png");
        var pipe2 = SKSpriteNode(texture: pipe2Texture);
        pipe2.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - 1000);
        
        self.addChild(pipe2);
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        bird.physicsBody?.velocity = CGVectorMake(0, 0); // Set speed back to 0
        bird.physicsBody?.applyImpulse(CGVectorMake(0, 50));
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
