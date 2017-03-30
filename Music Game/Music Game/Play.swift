//
//  Play.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-02-26.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class Play : SKScene {
	let score = NoteSpawner(text: "Score")
	var initialTime : Double = 0
	var prePauseTime : Double = 0
	var shouldUpdate = false
	var changePre = true
	var musicPlayer : AVAudioPlayer = AVAudioPlayer()
	let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Animal.mp3", ofType: nil)!)
	var time = 0
	override func update(_ currentTime: TimeInterval) {
		if initialTime == 0 {
			initialTime = currentTime
		}
		if shouldUpdate {
			shouldUpdate = false
			changePre = true
			print("UPDATED")
			initialTime = currentTime - prePauseTime
		}
		let pauseScreen = childNode(withName: "pauseScreen")
		print(currentTime - initialTime)
		if pauseScreen?.name != "pauseScreen" {
			time += 1
			if (time == 60) {
				time = 0
				score.midDot()
			} else if (time == 20) {
				score.rightDot()
			} else if (time == 40) {
				score.leftDot()
			}
			score.update()
		} else {
			if changePre {
				changePre = false
				prePauseTime = currentTime - initialTime
			}
		}
	}
	func play() {
		musicPlayer.play()
	}
	func makeUpdate() {
		shouldUpdate = true
	}
	func pause() {
		musicPlayer.pause()
	}
	override func didMove(to view: SKView) {
		let background = SKSpriteNode(imageNamed: "gameBackground")
		background.size = self.frame.size
		background.position = CGPoint(x: size.width/2, y: size.height/2)
		addChild(background)
		self.name = "playScene"
		let pauseButton = TouchNode(imageNamed: "pauseButton")
		pauseButton.size = CGSize(width: self.size.width/8, height: self.size.width/16)
		pauseButton.position = CGPoint(x: self.size.width/16, y: /*self.size.height-*/self.size.width/32)
		pauseButton.isUserInteractionEnabled = true
		pauseButton.zPosition = 1
		pauseButton.name = "pause"
		addChild(pauseButton)
		score.position = CGPoint(x: self.size.width/2, y: 19*self.size.height/20)
		score.fontSize = 80
		score.zPosition = 1
		addChild(score)
		do {
			try musicPlayer = AVAudioPlayer(contentsOf: url)
			musicPlayer.play()
		} catch let err as NSError{
			print(err.debugDescription)
		}
		//musicPlayer.name = "music"
		//addChild(musicPlayer)
		//musicPlayer.run(SKAction.playSoundFileNamed("Animal.mp3", waitForCompletion: false))
	}
}
