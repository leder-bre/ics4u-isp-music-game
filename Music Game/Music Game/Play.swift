//
//  Play.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-02-26.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import SpriteKit
import GameplayKit

class Play : SKScene {
    //override func update(
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "gameBackground")
        background.size = self.frame.size
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(background)

        let pauseButton = TouchNode(imageNamed: "pauseButton")
        pauseButton.size = CGSize(width: self.size.width/8, height: self.size.width/16)
        pauseButton.position = CGPoint(x: self.size.width/16, y: /*self.size.height-*/self.size.width/32)
        pauseButton.isUserInteractionEnabled = true
        pauseButton.zPosition = 1
        pauseButton.name = "pause"
        addChild(pauseButton)
        
        let score = SKLabelNode(text: "Score: 0")
        score.position = CGPoint(x: self.size.width/2, y: 19*self.size.height/20)
        score.fontSize = 80
        score.zPosition = 1
        addChild(score)
    }
}
