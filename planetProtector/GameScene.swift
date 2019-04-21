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
    
    var player = SKSpriteNode()
    
    var centerPoint = SKSpriteNode()
    
    var radius = CGFloat(0)
    var radians = 0.0
    
    var bullets: [Bullet] = []
    
    var enemys: [Enemy] = []
    var enemyTimer = 0
    
    var scoreCountLabel = SKLabelNode()
    var scoreCount = 0
    
    var livesCountLabel = SKLabelNode()
    var livesCount = 10
    
    override func didMove(to view: SKView) {
        //node that fires bullets
        player = self.childNode(withName: "dot") as! SKSpriteNode
        //node at the center of display
        centerPoint = self.childNode(withName: "origin") as! SKSpriteNode
        //raidus of where the player will be positioned and shoot from
        radius = 80
        //label of score
        scoreCountLabel = self.childNode(withName: "scoreCountLabel") as! SKLabelNode
        scoreCountLabel.text = String(scoreCount)
        //label of lives
        livesCountLabel = self.childNode(withName: "livesCountLabel") as! SKLabelNode
        livesCountLabel.text = String(livesCount)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        //Returns radians based on users touch
        radians = (Double(radiansOnTouch(posX: pos.x, posY: pos.y)))
        //Repositions player based on radians
        spin()
        //Fire bullet node based on position of player
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
        enemyTimer += 1
        if enemyTimer > 60 {
            enemyTimer = 0
            spawnEnemy()
            print(bullets.count)
        }
    }
    
    //Reposition player
    func spin() {
        player.zRotation = CGFloat(radians)
        player.position.x = centerPoint.position.x + CGFloat(cos(radians) * Double(radius))
        player.position.y = centerPoint.position.y + CGFloat(sin(radians) * Double(radius))
        radians += 0.03
    }
    
    //Spawn bullet based on players position
    func fire() {
        let bullet = Bullet()
        addChild(bullet)
        bullet.position.x = player.position.x*1.6
        bullet.position.y = player.position.y*1.6
        bullet.originPos = CGPoint(x: bullet.position.x, y: bullet.position.y)
        self.bullets.append(bullet)
    }
    
    //Calculate raidians based on users touch
    func radiansOnTouch(posX: CGFloat, posY: CGFloat) -> CGFloat{
        var radians = atan2(posY-0, posX-0)
        if radians < 0 {
            radians += .pi*2
        }
        return radians
    }
    
    //Check all objects in Scene and perform any actions necessary
    func checkObjects() {
        //1. Spawn bullets
        for bullet in bullets {
            bullet.position.x += bullet.originPos.x/10
            bullet.position.y += bullet.originPos.y/10
            //2. If bullets leave the frame, remove them
            if abs(bullet.position.x) > self.frame.size.width/2 || abs(bullet.position.y) > self.frame.size.height/2  {
                bullet.kill()
            }
            //3. Check if a bullet intersects with an enemy
            for enemy in enemys {
                if bullet.intersects(enemy) {
                    enemy.kill()
                    bullet.kill()
                    //Update score once hit
                    scoreCount += 1
                    scoreCountLabel.text = String(scoreCount)
                }
            }
        }
        //Move enemy towards player
        for enemy in enemys {
            enemy.position.x -= enemy.originPos.x/400
            enemy.position.y -= enemy.originPos.y/400
            if enemy.intersects(centerPoint) {
                enemy.kill()
                livesCount -= 1
                livesCountLabel.text = String(livesCount)
            }
        }
        //Check for any objects that were hit or off screen and remove them
        enemys.removeAll {$0.isHit == true}
        bullets.removeAll {$0.isHit == true}
    }
    
    //spawn and position enemy on raidus outside frame
    func spawnEnemy(){
        let enemy = Enemy()
        let ranRad = Double.random(in: 0 ... .pi*2)
        enemy.position.x = centerPoint.position.x + CGFloat(cos(ranRad) * Double(960.00))
        enemy.position.y = centerPoint.position.y + CGFloat(sin(ranRad) * Double(960.00))
        enemy.originPos = CGPoint(x: enemy.position.x, y: enemy.position.y)
        addChild(enemy)
        self.enemys.append(enemy)
    }
    
    //Notes
    //--Calculate 360 Degrees from radians
    //var degrees = radians * 180 / .pi
    //if degrees < 0 {
    //degrees += 360
    //}
    //return degrees
    
}
