//
//  Enemy.swift
//  planetProtector
//
//  Created by Gareth Woodman on 18/04/2019.
//  Copyright © 2019 Gareth Woodman. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Enemy: MovingObject {
    
    override init() {
        super.init()
        self.texture = SKTexture(imageNamed: "asteroid.png")
        self.size = (self.texture?.size())!
        self.setScale(0.5)
    }
    
    func spin() {
        self.zRotation += 0.01
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func kill() {
        
        if(!self.isHit){
            self.isHit = true
            var killTextures = [SKTexture]();
            killTextures.append(SKTexture(imageNamed: "asteroid1.png"));
            killTextures.append(SKTexture(imageNamed: "asteroid2.png"));
            killTextures.append(SKTexture(imageNamed: "asteroid3.png"));
            killTextures.append(SKTexture(imageNamed: "asteroid4.png"));
            
            let killAnimation = SKAction.animate(with: killTextures, timePerFrame: 0.1)
            self.run(SKAction.sequence([
                killAnimation,
                SKAction.run({self.removeFromParent()})
                ]));
        }
        //self.isHit = true
        //self.removeFromParent()
    }
    
}

