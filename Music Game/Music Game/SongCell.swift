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
    func setup() {
        self.size = CGSize(width: (self.scene?.size.width)!, height: (self.scene?.size.height)!)
    }
}
