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

class Enemy {
    
    var node = SKSpriteNode()
    var originPos = CGPoint()
    var velocity = CGFloat(1.1)
    
    init() {
        
    }
    
    init(node: SKSpriteNode) {
        self.node = node
    }
    
}

