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
        self.texture = SKTexture(imageNamed: "enemy.png")
        self.size = (self.texture?.size())!
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

