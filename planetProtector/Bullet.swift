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

class Bullet {
    
    var node = SKSpriteNode()
    var originPos = CGPoint()
    var velocity = 1.1
    
    init() {
        
    }
    
    init(node: SKSpriteNode) {
        self.node = node
    }
    
}
