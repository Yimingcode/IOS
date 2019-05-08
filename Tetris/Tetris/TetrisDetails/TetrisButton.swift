//
//  TetrisButton.swift
//  Tetris
//
//  Created by 徐一鸣 on 3/8/19.
//  Copyright © 2019 YimingXu. All rights reserved.
//

import SpriteKit

class TetrisButton: SKSpriteNode {
    
    override func contains(_ p: CGPoint) -> Bool {
        
        let centerX = self.frame.midX
        let centerY = self.frame.midY
        let distance = sqrt(pow(centerX - p.x, 2) + pow(centerY - p.y, 2))
        if distance < self.size.width / 2 {
            return true
        }
        
        return false
    }
}
