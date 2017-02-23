//
//  SongList.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-02-23.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class SongList: SKScene {
    let back = TouchNode(imageNamed: "backButton")
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.blue
        let background = SKSpriteNode(imageNamed: "splashBackground")
        background.size = self.frame.size
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        back.position = CGPoint(x: 200, y: 1400)
        back.size = CGSize(width: self.size.width/8, height: self.size.width/16)
        back.isUserInteractionEnabled = true
        addChild(back)
    }
}
