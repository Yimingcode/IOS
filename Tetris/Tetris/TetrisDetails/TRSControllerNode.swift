//
//  TRSControllerNode.swift
//  TetrisLite
//
//  Created by 徐一鸣 on 3/8/19.
//  Copyright © 2019 YimingXu. All rights reserved.
//

import SpriteKit

class TRSControllerNode: SKNode {
    
    internal var btnLeft: TetrisButton = TetrisButton(imageNamed: "button_left.png")
    internal var btnDrop: TetrisButton = TetrisButton(imageNamed: "button_drop.png")
    internal var btnRight: TetrisButton = TetrisButton(imageNamed: "button_right.png")
    internal var btnDown: TetrisButton = TetrisButton(imageNamed: "button_down.png")
    internal var btnRotate: TetrisButton = TetrisButton(imageNamed: "button_rotate.png")
    
    override init() {
        super.init()
        
        let deviceScreenMode = UIScreen.main.currentMode;
        let btnWidth = (deviceScreenMode?.size.width)! / 5
        
        btnLeft.position = CGPoint(x: 50, y: 50 + btnWidth * 0.8)
        btnLeft.anchorPoint = CGPoint.zero
        btnLeft.size = CGSize(width: btnWidth, height: btnWidth)
        
        btnDrop.position = CGPoint(x: 50 + btnWidth * 0.8, y: 50 + btnWidth * 1.6)
        btnDrop.anchorPoint = CGPoint.zero
        btnDrop.size = CGSize(width: btnWidth, height: btnWidth)
        
        btnRight.position = CGPoint(x: 50 + btnWidth * 1.6, y: 50 + btnWidth * 0.8)
        btnRight.anchorPoint = CGPoint.zero
        btnRight.size = CGSize(width: btnWidth, height: btnWidth)
        
        btnDown.position = CGPoint(x: 50 + btnWidth * 0.8, y: 50)
        btnDown.anchorPoint = CGPoint.zero
        btnDown.size = CGSize(width: btnWidth, height: btnWidth)
        
        btnRotate.position = CGPoint(x: (deviceScreenMode?.size.width)! - 50 - btnWidth - 50, y: 50 + btnWidth * 0.8 - 15)
        btnRotate.anchorPoint = CGPoint.zero
        btnRotate.size = CGSize(width: btnWidth + 50, height: btnWidth + 50)

        self.addChild(btnLeft)
        self.addChild(btnDrop)
        self.addChild(btnRight)
        self.addChild(btnDown)
        self.addChild(btnRotate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
