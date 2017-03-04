//
//  SongCell.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-02-23.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import SpriteKit
import GameKit

class SongCell : SKSpriteNode {
    func setup(album : String,  song : String, artist : String) {
        let albumArt = SKSpriteNode(imageNamed: album)
        let songText = SKLabelNode(text: song)
        let artistText = SKLabelNode(text: artist)
        
        albumArt.position = CGPoint(x: -1*self.size.width/3, y: 0)
        albumArt.size = CGSize(width: 3*(self.size.height)/2, height: 3*self.size.height/4)
        albumArt.zPosition = 1
        addChild(albumArt)
        
        songText.position = CGPoint(x: self.size.width/10, y: 0)
        songText.fontSize = 120
        songText.zPosition = 1
        addChild(songText)
        
        artistText.position = CGPoint(x: self.size.width/10, y: -self.size.height/3)
        artistText.fontSize = 120
        artistText.zPosition = 1
        addChild(artistText)
    }
}
