//
//  Bullet.swift
//  planetProtector
//
//  Created by Gareth Woodman on 17/04/2019.
//  Copyright © 2019 Gareth Woodman. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Bullet: MovingObject {
    
    override init() {
        //inhereit all properties from MovingObject
        super.init()
        self.texture = SKTexture(imageNamed: "bullet.png")
        self.size = (self.texture?.size())!
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeTexture() {
        
    }
    
    func kill() {
        self.isHit = true
        self.removeFromParent()
    }
}
