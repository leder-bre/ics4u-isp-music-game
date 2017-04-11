//
//  GameScene.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-02-13.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

	override func didMove(to view: SKView) {
		let splash : SKScene = Splash(size: self.size)
		scene?.view?.presentScene(splash)
	}
}
