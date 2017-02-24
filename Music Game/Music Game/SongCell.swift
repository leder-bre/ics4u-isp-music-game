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
        
    }
}
