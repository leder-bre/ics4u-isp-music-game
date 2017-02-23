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
	let play = TouchNode(imageNamed: "playButton")
	let settings = TouchNode(imageNamed: "SettingIcon")
	override func update(_ currentTime: TimeInterval) {
	}
	
	override func didMove(to view: SKView) {
		let testScene : SKScene = SongList(size: self.size)
		testScene.size = self.size
		self.name = "splashScreen"
		backgroundColor = SKColor.black
		let background = SKSpriteNode(imageNamed: "splashBackground")
		background.size = self.frame.size
		background.position = CGPoint(x: size.width/2, y: size.height/2)
		addChild(background)
		play.position = CGPoint(x: self.size.width/2, y: 3*self.size.height/4)
		play.name = "play"
		play.size = CGSize(width: self.size.width/4, height: self.size.width/8)
		play.isUserInteractionEnabled = true
		play.zPosition = 1
		settings.position = CGPoint(x: self.size.width/2, y: 2*self.size.height/4)
		settings.name = "play"
		play.size = CGSize(width: self.size.width/4, height: self.size.width/8)
		settings.isUserInteractionEnabled = true
		settings.zPosition = 1
		addChild(play)
	}
}
