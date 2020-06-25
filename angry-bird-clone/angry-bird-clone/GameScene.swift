//
//  GameScene.swift
//  angry-bird-clone
//
//  Created by Athanasios Canko on 23.6.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var bird2 = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.anchorPoint = CGPoint(x: 0, y: 0)
        bird2.size = CGSize(width: 100, height: 100)
        bird2.zPosition = 1
        self.addChild(bird2)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
