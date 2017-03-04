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
    let score = NoteSpawner(text: "Score: 0")
    var time = 0
    override func update(_ currentTime: TimeInterval) {
        time += 1
        if (time == 60) {
            time = 0
            score.midDot()
        } else if (time == 20) {
            score.rightDot()
        } else if (time == 40) {
            score.leftDot()
        }
        score.update()
    }
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
        score.position = CGPoint(x: self.size.width/2, y: 19*self.size.height/20)
        score.fontSize = 80
        score.zPosition = 1
        addChild(score)
    }
}
