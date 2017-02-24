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
    let albums = [String]()
    let songs = [String]()
    let artist = [String]()
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.gray
        back.position = CGPoint(x: self.size.width/16, y: self.size.height-self.size.width/32)
        back.size = CGSize(width: self.size.width/8, height: self.size.width/16)
        back.isUserInteractionEnabled = true
        back.zPosition = 1
        addChild(back)
        var testCellArray = [SongCell]()
        for i in 1...6 {
            let testCell = SongCell(imageNamed: "Rectangle")
            testCell.size = CGSize(width: self.size.width, height: self.size.height/6)
            testCell.position = CGPoint(x: self.size.width/2, y: CGFloat(i)*self.size.height/6-self.size.height/12)
            testCell.name = "tableCell[\(i-1)]"
            testCell.setup(album: "AnimalNeonTress", song: <#T##String#>, artist: <#T##String#>)
            testCellArray.append(testCell)
            addChild(testCell)
        }
        //addChild(testCellArray)
    }
}
