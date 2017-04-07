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
	var shouldResetTime = true
	var changePre = true
	var recording = false
	var addMid = false
	var addLeft = false
	var addRight = false
	var midIndex = 0
	var leftIndex = 0
	var rightIndex = 0
	var recordedMid = [Float]()
	var recordedLeft = [Float]()
	var recordedRight = [Float]()
	var musicPlayer : AVAudioPlayer = AVAudioPlayer()
    var hasStartedPlaying = false
	let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Animal.mp3", ofType: nil)!)
	var time = 0
	let file = "Animal.txt"
	override func update(_ currentTime: TimeInterval) {
		if shouldResetTime {
			shouldResetTime = false
			initialTime = currentTime
            score.midDot()
		}
		if shouldUpdate {
			shouldUpdate = false
			changePre = true
			initialTime = currentTime - prePauseTime
		}
		let pauseScreen = childNode(withName: "pauseScreen")
		if pauseScreen?.name != "pauseScreen" {
			if recording {
				if addLeft {
					addLeft = false
					recordedLeft.append(Float(currentTime)-Float(initialTime))
				}
				if addMid {
					addMid = false
					recordedMid.append(Float(currentTime)-Float(initialTime))
				}
				if addRight {
					addRight = false
					recordedRight.append(Float(currentTime)-Float(initialTime))
				}
			} else {
                if !hasStartedPlaying {
                    if currentTime-initialTime > 7.56 {
                        hasStartedPlaying = true
                        musicPlayer.play()
                    }
                }
				var looping = true
				while looping {
					looping = false
					if midIndex < recordedMid.count {
						if Float(currentTime-initialTime) > recordedMid[midIndex] {
							looping = true
							midIndex += 1
							score.midDot()
						}
					}
					if leftIndex < recordedLeft.count {
						if Float(currentTime-initialTime) > recordedLeft[leftIndex] {
							looping = true
							leftIndex += 1
							score.leftDot()
						}
					}
					if rightIndex < recordedRight.count {
						if Float(currentTime-initialTime) > recordedRight[rightIndex] {
							looping = true
							rightIndex += 1
							score.rightDot()
						}
					}
				}
				score.update()
			}
		} else {
			if changePre {
				changePre = false
				prePauseTime = currentTime - initialTime
			}
		}
	}
    func clearSequences() {
        recordedMid = []
        recordedLeft = []
        recordedRight = []
    }
	func sequenceString() -> String {
		var stringseq = ""
		if recordedLeft.count > 0 {
			for i in 0...recordedLeft.count-1 {
				stringseq += "\(recordedLeft[i])"
                stringseq += i == recordedLeft.count-1 ? "" : ","
			}
		}
        stringseq += ":"
        if recordedMid.count > 0 {
            for i in 0...recordedMid.count-1 {
                stringseq += "\(recordedMid[i])"
                stringseq += i == recordedMid.count-1 ? "" : ","
            }
        }
        stringseq += ":"
        if recordedRight.count > 0 {
            for i in 0...recordedRight.count-1 {
                stringseq += "\(recordedRight[i])"
                stringseq += i == recordedRight.count-1 ? "" : ","
            }
        }
        print(stringseq)
        return stringseq
	}
    func removeScoreNodes() {
        score.removeAllChildren()
    }
	func startRecording() {
		if recording {
			childNode(withName: "recordButton0")?.removeFromParent()
			childNode(withName: "recordButton1")?.removeFromParent()
			childNode(withName: "recordButton2")?.removeFromParent()
			hasStartedPlaying = false
            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
				print("directoryadded")
                let path = dir.appendingPathComponent(file)
                do {
                    try sequenceString().write(to: path, atomically: false, encoding: String.Encoding.utf8)
                } catch let err as NSError {
                    print(err.debugDescription)
                }
            }
		} else {
			play()
            clearSequences()
			let button = TouchNode(imageNamed: "player_record")
			button.isUserInteractionEnabled = true
			button.zPosition = 1
			button.size = CGSize(width: self.size.width/4, height: self.size.width/8)
			button.position = CGPoint(x: self.size.width/6, y: self.size.width/6)
			button.name = "recordButton0"
			addChild(button)
			
			let button1 = TouchNode(imageNamed: "player_record")
			button1.isUserInteractionEnabled = true
			button1.zPosition = 1
			button1.size = CGSize(width: self.size.width/4, height: self.size.width/8)
			button1.position = CGPoint(x: 5*self.size.width/6, y: self.size.width/6)
			button1.name = "recordButton1"
			addChild(button1)
			
			let button2 = TouchNode(imageNamed: "player_record")
			button2.isUserInteractionEnabled = true
			button2.zPosition = 1
			button2.size = CGSize(width: self.size.width/4, height: self.size.width/8)
			button2.position = CGPoint(x: self.size.width/2, y: self.size.width/6)
			button2.name = "recordButton2"
			addChild(button2)
		}
		recording = !recording
	}
	func stop() {
		musicPlayer.stop()
		do {
			try musicPlayer = AVAudioPlayer(contentsOf: url)
		} catch let err as NSError{
			print(err.debugDescription)
		}
	}
	func play() {
		musicPlayer.play()
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
		pauseButton.position = CGPoint(x: self.size.width/16, y: self.size.width/32)
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
		} catch let err as NSError{
			print(err.debugDescription)
		}
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			print("directoryadded")
			let path = dir.appendingPathComponent(file)
			do {
				let text2 = try String(contentsOf: path, encoding: String.Encoding.utf8)
				print(text2.components(separatedBy: ":"))
				if text2.components(separatedBy: ":")[0].components(separatedBy: ",").count != 0 {
					for i in 0...text2.components(separatedBy: ":")[0].components(separatedBy: ",").count-1 {
						recordedLeft.append(Float(text2.components(separatedBy: ":")[0].components(separatedBy: ",")[i])!)
					}
				}
				if text2.components(separatedBy: ":")[1].components(separatedBy: ",").count != 0 {
					for i in 0...text2.components(separatedBy: ":")[1].components(separatedBy: ",").count-1 {
						recordedMid.append(Float(text2.components(separatedBy: ":")[1].components(separatedBy: ",")[i])!)
					}
				}
				if text2.components(separatedBy: ":")[2].components(separatedBy: ",").count != 0 {
					for i in 0...text2.components(separatedBy: ":")[2].components(separatedBy: ",").count-1 {
						recordedRight.append(Float(text2.components(separatedBy: ":")[2].components(separatedBy: ",")[i])!)
					}
				}
			} catch let err as NSError {
				print(err.debugDescription)
			}
		}
	}
}
