//
//  TRSNextShapeLayerNode.swift
//  TetrisLite
//
//  Created by 徐一鸣 on 4/8/19.
//  Copyright © 2019 YimingXu. All rights reserved.
//

import SpriteKit

class TRSNextShapeLayerNode: SKNode {
    
    var next1: TRSShape? = nil
    
    override init() {
        super.init()
    }
    
    func setNextShape(newNext: TRSShape) {
        if next1 != nil {
            self.next1!.removeFromParent()
        }
        
        self.next1 = newNext
        
        newNext.left = 0
        newNext.top = 0
        self.addChild(newNext)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
