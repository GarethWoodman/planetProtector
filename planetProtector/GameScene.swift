//
//  GameScene.swift
//  circularPath
//
//  Created by Gareth Woodman on 16/04/2019.
//  Copyright © 2019 Gareth Woodman. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var dot = SKSpriteNode()
    var origin = SKSpriteNode()
    var radius = CGFloat(0)
    var angle = 0.0
    var bullets: [Bullet] = []
    
    override func didMove(to view: SKView) {
        dot = self.childNode(withName: "dot") as! SKSpriteNode
        origin = self.childNode(withName: "origin") as! SKSpriteNode
        radius = 80
            //origin.size.width/2
    }
    
    func touchDown(atPoint pos : CGPoint) {
        //angle += 0.1
        //bullet.removeAllActions()
        angle = ((2 * .pi) / 360) * (Double(degreesOnTouch(posX: pos.x, posY: pos.y)))
        spin()
        fire()
    }
    
    func touchMoved(toPoint pos : CGPoint) {
 
    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        checkObjects()
    }
    
    func spin() {
        print(angle)
        dot.zRotation = CGFloat(angle)
        dot.position.x = origin.position.x + CGFloat(cos(angle) * Double(radius))
        dot.position.y = origin.position.y + CGFloat(sin(angle) * Double(radius))
        angle += 0.03
    }
    
    
    //dot.position.x = origin.position.x + 
    
    func fire() {
        let bullet = Bullet(node: SKSpriteNode(imageNamed: "bullet.png"))
        addChild(bullet.node)
        
        bullet.node.position.x = dot.position.x*1.6
        bullet.node.position.y = dot.position.y*1.6
        
        bullet.originPos = CGPoint(x: bullet.node.position.x, y: bullet.node.position.y)

        self.bullets.append(bullet)
    }
    
    func degreesOnTouch(posX: CGFloat, posY: CGFloat) -> CGFloat{
        let radians = atan2(posY-0, posX-0)
        print(radians)
        var degrees = radians * 180 / .pi
        if degrees < 0 {
            degrees += 360
        }
        return degrees
    }
    
    func checkObjects() {
        for bullet in bullets {
            bullet.node.position.x += bullet.originPos.x/10
            bullet.node.position.y += bullet.originPos.y/10
            if abs(bullet.node.position.x) > self.frame.size.width/2 || abs(bullet.node.position.y) > self.frame.size.height/2  {
                bullet.node.removeFromParent()
            }
        }
    }
    
}
