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
	var transistion : SKTransition = SKTransition.fade(withDuration: 1)
	//var testScene : SKScene = GameScene(size: CGSize(width: 2000, height: 2000))
	//var splashScreen : SKScene = GameScene(size: CGSize(width: 2000, height: 2000))
	override func update(_ currentTime: TimeInterval) {
	}
	
	override func didMove(to view: SKView) {
		var testScene : SKScene = GameScene(size: self.size)
		var splashScreen : SKScene = GameScene(size: self.size)
		testScene.size = self.size
		splashScreen.size = self.size
		backgroundColor = SKColor.black
		let background = SKSpriteNode(imageNamed: "splashBackground")
		background.size = self.frame.size
		background.position = CGPoint(x: size.width/2, y: size.height/2)
		play.position = CGPoint(x: 1000, y: 1000)
		play.isUserInteractionEnabled = true
		splashScreen.addChild(background)
		splashScreen.addChild(play)
		//scene?.view?.presentScene(splashScreen)
		//self.view?.presentScene(splashScreen)
	}
}
