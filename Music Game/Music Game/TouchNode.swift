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
        let splashScreen : SKScene = GameScene(size: (self.scene!.frame.size))
        let songScene : SKScene = SongList(size: (self.scene!.frame.size))
        let settingScene : SKScene = Settings(size: self.scene!.frame.size)
        if scene?.name == "splashScreen" {
            if self.name == "play" {
                scene?.scene?.view?.presentScene(songScene)
            } else if self.name == "setting" {
                scene?.scene?.view?.presentScene(settingScene)
            }
        } else {
            scene?.scene?.view?.presentScene(splashScreen)
        }
    }
}
