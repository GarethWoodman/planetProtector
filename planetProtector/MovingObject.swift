//
//  MovingObject.swift
//  planetProtector
//
//  Created by United Kingdom Local Admin on 21/04/2019.
//  Copyright © 2019 Gareth Woodman. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class MovingObject: SKSpriteNode {
    var originPos: CGPoint
    var isHit: Bool
    
    init() {
        self.originPos = CGPoint()
        self.isHit = false
        super.init(texture: nil, color: .clear, size: CGSize())
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func kill() {
        self.isHit = true
        self.removeFromParent()
    }
    
}
