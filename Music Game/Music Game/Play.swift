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
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "gameBackground")
        background.size = self.frame.size
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(background)

        let pauseButton = TouchNode(imageNamed: "pause")
        pauseButton.size = CGSize(width: self.size.width/8, height: self.size.width/16)
        pauseButton.position = CGPoint(x: self.size.width/16, y: self.size.height-self.size.width/32)
        pauseButton.isUserInteractionEnabled = true
        addChild(pauseButton)
    }
}
