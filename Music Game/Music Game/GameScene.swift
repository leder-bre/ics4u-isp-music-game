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
	let play = SKSpriteNode(imageNamed: "playButton")
	var transistion : SKTransition = SKTransition.fade(withDuration: 1)
	override func update(_ currentTime: TimeInterval) {
			//play.position = CGPoint(x: play.position.x+4, y: play.position.y)
	}
	
	override func didMove(to view: SKView) {
		backgroundColor = SKColor.black
		let background = TouchNode(imageNamed: "splashBackground")
		background.size = self.frame.size
		background.position = CGPoint(x: size.width/2, y: size.height/2)
		play.position = CGPoint(x: 1000, y: 1000)
		play.isUserInteractionEnabled = true
		addChild(background)
		addChild(play)

	}
}
