//
//  Settings.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-02-23.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Settings: SKScene {
    let back = TouchNode(imageNamed: "backButton")
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.red
        back.position = CGPoint(x: self.size.width/16, y: self.size.height-self.size.width/32)
        back.size = CGSize(width: self.size.width/8, height: self.size.width/16)
        back.isUserInteractionEnabled = true
        back.name = "splash"
        addChild(back)
    }
}
