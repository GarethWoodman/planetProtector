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

class Enemy: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "enemy.png")
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var originPos = CGPoint()
    var isHit = false
    
}

