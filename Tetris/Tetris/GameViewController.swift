//
//  GameViewController.swift
//  Tetris
//
//  Created by 徐一鸣 on 3/8/19.
//  Copyright © 2019 YimingXu. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var gameScene: GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = SKView.init(frame: UIScreen.main.bounds)
        skView.contentMode = UIView.ContentMode.scaleToFill;
        skView.showsFPS = true;
        skView.showsNodeCount = true;
        skView.backgroundColor = UIColor.lightGray
        skView.ignoresSiblingOrder = true;
        self.view = skView;
        
        let deviceScreenMode = UIScreen.main.currentMode;
        self.gameScene = GameScene.init(size: CGSize(width: (deviceScreenMode?.size.width)!, height: (deviceScreenMode?.size.height)!))
        self.gameScene!.scaleMode = .aspectFit
        self.gameScene?.backgroundColor = UIColor.darkGray
        skView.presentScene(self.gameScene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
