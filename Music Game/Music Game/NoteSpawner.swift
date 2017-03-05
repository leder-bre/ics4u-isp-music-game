//
//  NoteSpawner.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-03-01.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import SpriteKit
import GameKit

class NoteSpawner : SKLabelNode {
	var leftCount = 0
	var leftMax = 0
	var rightCount = 0
	var rightMax = 0
	var midCount = 0
	var midMax = 0
	func update() {
		let scoreNode = childNode(withName: "score") as? SKLabelNode
		if let scoreText = scoreNode?.text {
			switch scoreText {
			case "red":
				childNode(withName: "red\(leftMax-leftCount)")?.removeFromParent()
				break
			case "blu":
				childNode(withName: "blue\(rightMax-rightCount)")?.removeFromParent()
				break
			case "gre":
				childNode(withName: "green\(midMax-midCount)")?.removeFromParent()
				break
			default:
				break
			}
		}
		childNode(withName: "score")?.removeFromParent()
		if midCount > 0 {
			for i in (midMax-midCount)..<midMax {
				childNode(withName: "green\(i)")?.position.y -= 10
				if childNode(withName: "green\(i)") != nil {
					if ((Int)((childNode(withName: "green\(i)")?.position.y)!) < -(Int)(4*(scene?.size.height)!/5)) {
						childNode(withName: "green\(i)")?.removeFromParent()
						midCount-=1
					}
				}
			}
		}
		if rightCount > 0 {
			for i in (rightMax-rightCount)..<rightMax {
				childNode(withName: "blue\(i)")?.position.y -= 10
				if childNode(withName: "blue\(i)") != nil {
					if ((Int)((childNode(withName: "blue\(i)")?.position.y)!) < -(Int)(4*(scene?.size.height)!/5)) {
						childNode(withName: "blue\(i)")?.removeFromParent()
						rightCount-=1
					}
				}
			}
		}
		if leftCount > 0 {
			for i in (leftMax-leftCount)..<leftMax {
				childNode(withName: "red\(i)")?.position.y -= 10
				if childNode(withName: "red\(i)") != nil {
					if ((Int)((childNode(withName: "red\(i)")?.position.y)!) < -(Int)(4*(scene?.size.height)!/5)) {
						childNode(withName: "red\(i)")?.removeFromParent()
						leftCount-=1
					}
				}
			}
		}
	}
	func leftDot() {
		let red = TouchNode(imageNamed: "red")
		red.name = "red\(leftMax)"
		red.isUserInteractionEnabled = true
		red.size = CGSize(width: 160, height: 80)
		red.position = CGPoint(x: -(scene?.size.width)!/3, y: red.size.height*2)
		leftCount += 1
		leftMax += 1
		addChild(red)
	}
	func rightDot() {
		let blue = TouchNode(imageNamed: "blue")
		blue.name = "blue\(rightMax)"
		blue.isUserInteractionEnabled = true
		blue.size = CGSize(width: 160, height: 80)
		blue.position = CGPoint(x: (scene?.size.width)!/3, y: blue.size.height*2)
		rightCount += 1
		rightMax += 1
		addChild(blue)
	}
	func midDot() {
		let green = TouchNode(imageNamed: "green")
		green.name = "green\(midMax)"
		green.isUserInteractionEnabled = true
		green.size = CGSize(width: 160, height: 80)
		green.position = CGPoint(x: 0, y: green.size.height*2)
		midCount += 1
		midMax += 1
		addChild(green)
	}
}
