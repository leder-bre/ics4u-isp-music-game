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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touched")
    }
}
