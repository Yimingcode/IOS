//
//  TRSInfoLayerNode.swift
//  TetrisLite
//
//  Created by 徐一鸣 on 4/8/19.
//  Copyright © 2019 YimingXu. All rights reserved.
//

import SpriteKit

class TRSInfoLayerNode: SKNode {
    
    internal var scoreLabel: SKLabelNode = SKLabelNode(fontNamed:"Chalkduster")
    internal var linesLabel: SKLabelNode = SKLabelNode(fontNamed:"Chalkduster")
    internal var msssageLabel: SKLabelNode = SKLabelNode(fontNamed:"Chalkduster")
    
    override init() {
        super.init()
        
        let deviceScreenMode = UIScreen.main.currentMode;
        
        scoreLabel.text = "score 0"
        scoreLabel.fontSize = 22
        scoreLabel.position = CGPoint(x: 60 ,y: (deviceScreenMode?.size.height)! - 50)
        
        linesLabel.text = "lines 0"
        linesLabel.fontSize = 22
        linesLabel.position = CGPoint(x: 60, y: (deviceScreenMode?.size.height)! - 80)
        
        msssageLabel.text = ""
        msssageLabel.fontSize = 22
        msssageLabel.position = CGPoint(x: 70, y: (deviceScreenMode?.size.height)! - 110)
        
        self.addChild(scoreLabel)
        self.addChild(linesLabel)
        self.addChild(msssageLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
