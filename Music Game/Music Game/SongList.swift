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
        back.position = CGPoint(x: self.size.width/16, y: self.size.height-self.size.width/32)
        back.size = CGSize(width: self.size.width/8, height: self.size.width/16)
        back.isUserInteractionEnabled = true
        addChild(back)
        let testCell = SongCell(imageNamed: "Rectangle")
        testCell.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        testCell.setup()
        addChild(testCell)
    }
}
