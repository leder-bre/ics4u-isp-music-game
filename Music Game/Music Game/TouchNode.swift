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
	var indexing = 0
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let splashScreen : SKScene = GameScene(size: (self.scene!.frame.size))
		let songScene : SKScene = SongList(size: (self.scene!.frame.size))
		let settingScene : SKScene = Settings(size: self.scene!.frame.size)
		let playScene : SKScene = Play(size: self.scene!.frame.size)
		guard let theName = self.name else {
			return
		}
		switch theName {
		case "play":
			scene?.scene?.view?.presentScene(songScene)
			self.scene?.removeAllChildren()
			break
		case "setting":
			scene?.scene?.view?.presentScene(settingScene)
			self.scene?.removeAllChildren()
			break
		case "splash":
			scene?.scene?.view?.presentScene(splashScreen)
			self.scene?.removeAllChildren()
			break
		case "gameButton":
			if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
				let path = dir.appendingPathComponent("songName.txt")
				let songs = ["Animal", "Feel Good Inc", "Gloe", "Run", "Africa", "Everybody Talks"]
				do {
					try songs[indexing].write(to: path, atomically: false, encoding: String.Encoding.utf8)
				} catch let err as NSError {
					print(err.debugDescription)
				}
			}
			scene?.scene?.view?.presentScene(playScene)
			self.scene?.removeAllChildren()
			break
		case "pause":
			let pauseScreen = TouchNode(imageNamed: "black")
			pauseScreen.size = CGSize(width: (scene?.size.width)!, height: (scene?.size.height)!)
			pauseScreen.position = CGPoint(x: (scene?.size.width)!/2, y: (scene?.size.height)!/2)
			pauseScreen.zPosition = 2
			pauseScreen.isUserInteractionEnabled = true
			pauseScreen.name = "pauseScreen"
			parent?.addChild(pauseScreen)
			if let parentTest : Play = parent as? Play {
				parentTest.pause()
			}
			// Back Button
			let backButton = TouchNode(imageNamed: "backButton")
			backButton.size = CGSize(width: (scene?.size.width)!/4, height: (scene?.size.width)!/8)
			backButton.isUserInteractionEnabled = true
			backButton.position = CGPoint(x: (scene?.size.width)!/2, y: (scene?.size.height)!/2)
			backButton.zPosition = 3
			backButton.name = "play"
			parent?.addChild(backButton)
			// Record Button
			let record = TouchNode(imageNamed: "player_record")
			record.size = CGSize(width: (scene?.size.width)!/4, height: (scene?.size.width)!/8)
			record.isUserInteractionEnabled = true
			record.position = CGPoint(x: (scene?.size.width)!/2, y: 3*(scene?.size.height)!/4)
			record.zPosition = 3
			record.name = "record"
			parent?.addChild(record)
			break
		case "pauseScreen":
			parent?.childNode(withName: "play")?.removeFromParent()
			parent?.childNode(withName: "record")?.removeFromParent()
			if let parentTest : Play = parent as? Play {
				parentTest.hasStartedPlaying = false
				parentTest.shouldUpdate = true
			}
			self.removeFromParent()
			break
		case "record":
			parent?.childNode(withName: "play")?.removeFromParent()
			parent?.childNode(withName: "pauseScreen")?.removeFromParent()
			if let parentTest : Play = parent as? Play {
				parentTest.stop()
				parentTest.removeScoreNodes()
				parentTest.shouldResetTime = true
				parentTest.startRecording()
			}
			self.removeFromParent()
			break
		case "recordButton0":
			if let parentTest : Play = parent as? Play {
				parentTest.addLeft = true
			}
			break
		case "recordButton1":
			if let parentTest : Play = parent as? Play {
				parentTest.addRight = true
			}
			break
		case "recordButton2":
			if let parentTest : Play = parent as? Play {
				parentTest.addMid = true
			}
			break
		default:
			let name = theName.substring(to: theName.index(theName.startIndex, offsetBy: 3))
			if (name == "red" || name == "gre" || name == "blu") {
				if self.position.y < -950 {
					let score : SKNode = SKLabelNode(text: name)
					score.alpha = 0
					score.name = "score"
					self.parent?.addChild(score)
				}
			}
			break
		}
	}
}
