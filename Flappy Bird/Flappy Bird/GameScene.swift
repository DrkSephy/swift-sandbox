//
//  GameScene.swift
//  Flappy Bird
//
//  Created by David Leonard on 3/26/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var score = 0; // Score counter
    var scoreLabel = SKLabelNode();
    
    var bird = SKSpriteNode(); // An entity in our game
    var bg = SKSpriteNode();
    let birdGroup: UInt32 = 1;
    let objectGroup: UInt32 = 2;
    let gapGroup: UInt32 = 0 << 3; // Reduce an integer to its binary representation
    var gameOver = 0;
    var movingObjects = SKNode(); // Allow us to access the pipes and background

    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self; // Set up collison delegate
        self.physicsWorld.gravity = CGVectorMake(0, -5); // Set gravity
        self.addChild(movingObjects);
        
        // Set up score label
        scoreLabel.fontName = "Helvetica";
        scoreLabel.fontSize = 60;
        scoreLabel.text = "0";
        scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - 70);
        scoreLabel.zPosition = 10;
        self.addChild(scoreLabel);
        
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
            movingObjects.addChild(bg);
            
            
        }
        
        bird = SKSpriteNode(texture: birdTexture); // Add the texture
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame)); // Set position
        bird.runAction(makeBirdFlap); // Apply the animation
        
        // Setup bird physics
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height / 2);
        bird.physicsBody?.dynamic = true;
        // Disable bird from rotating
        bird.physicsBody?.allowsRotation = false;
        bird.physicsBody?.categoryBitMask = birdGroup; // Add a collision category to the bird
        bird.physicsBody?.collisionBitMask = gapGroup;
        bird.physicsBody?.contactTestBitMask = objectGroup;
        bird.zPosition = 10;
        self.addChild(bird);
        
        var ground = SKNode();
        ground.position = CGPointMake(0, 0);
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1));
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.categoryBitMask = objectGroup;
        self.addChild(ground);
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("makePipes"), userInfo: nil, repeats: true);
    }
    
    func makePipes() {
        // Create pipe gap
        let gapHeight = bird.size.height * 4;
        // Randomly shift the pipes
        var movementAmount = arc4random() % UInt32(self.frame.size.height / 2);
        var pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4;
        
        var movePipes = SKAction.moveByX(-self.frame.size.width * 2, y: 0, duration: NSTimeInterval(self.frame.size.width / 100));
        
        var removePipes = SKAction.removeFromParent();
        var moveAndRemovePipes = SKAction.sequence([movePipes, removePipes]); // Make background repeat forever
        
        // Create pipe 1
        var pipe1Texture = SKTexture(imageNamed: "img/pipe1.png");
        var pipe1 = SKSpriteNode(texture: pipe1Texture);
        pipe1.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipe1.size.height/2 + gapHeight / 2 + pipeOffset);
        pipe1.runAction(moveAndRemovePipes);
        pipe1.physicsBody = SKPhysicsBody(rectangleOfSize: pipe1.size);
        pipe1.physicsBody?.dynamic = false;
        pipe1.physicsBody?.categoryBitMask = objectGroup;
        movingObjects.addChild(pipe1);
        
        // Create pipe 2
        var pipe2Texture = SKTexture(imageNamed: "img/pipe2.png");
        var pipe2 = SKSpriteNode(texture: pipe2Texture);
        pipe2.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) - pipe2.size.height/2 - gapHeight / 2 + pipeOffset);
        pipe2.runAction(moveAndRemovePipes);
        pipe2.physicsBody = SKPhysicsBody(rectangleOfSize: pipe2.size);
        pipe2.physicsBody?.dynamic = false;
        pipe2.physicsBody?.categoryBitMask = objectGroup;
        movingObjects.addChild(pipe2);
        
        var gap = SKNode();
        gap.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipeOffset);
        gap.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(pipe1.size.width, gapHeight))
        gap.runAction(moveAndRemovePipes);
        gap.physicsBody?.dynamic = false;
        gap.physicsBody?.collisionBitMask = gapGroup;
        gap.physicsBody?.categoryBitMask = gapGroup;
        gap.physicsBody?.contactTestBitMask = birdGroup;
        movingObjects.addChild(gap);
        

    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == gapGroup || contact.bodyB.categoryBitMask == gapGroup {
            score++;
            scoreLabel.text = "\(score)";
        } else {
            gameOver = 1;
            movingObjects.speed = 0;
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        if gameOver == 0 {
            bird.physicsBody?.velocity = CGVectorMake(0, 0); // Set speed back to 0
            bird.physicsBody?.applyImpulse(CGVectorMake(0, 50));
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
