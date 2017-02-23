//
//  TouchNode.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-02-22.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import Foundation
import SpriteKit

class TouchNode : SKSpriteNode {
    
    var transistion : SKTransition = SKTransition.fade(withDuration: 1)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touched")
        let splashScreen : SKScene = GameScene(size: (self.scene!.size))
        let songScene : SKScene = SongList(size: (self.scene!.size))
        if scene?.name == "splashScreen" {
            scene?.scene?.view?.presentScene(songScene)
            print("Splash")
        } else {
            scene?.scene?.view?.presentScene(splashScreen)
            print("Song")
        }
    }
}
