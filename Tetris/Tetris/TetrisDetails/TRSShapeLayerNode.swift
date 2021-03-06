//
//  TRSShapeLayerNode.swift
//  TetrisLite
//
//  Created by 徐一鸣 on 4/12/19.
//  Copyright © 2019 YimingXu. All rights reserved.
//

import SpriteKit

class TRSShapeLayerNode: SKNode {
    
    internal var killLines: Int = 0
    internal var fixedBlocks: Array<TRSBrick> = Array<TRSBrick>()
    private var killLinesBlock: ((Int) -> ())? = nil
    
    override init() {
        super.init()
        
        let line1 = SKSpriteNode()
        line1.color = UIColor.lightGray
        line1.size = CGSize(width: 1, height: 40 * 20)
        line1.anchorPoint = CGPoint.zero
        line1.position = CGPoint(x: -2, y: 0)
        
        let line2 = SKSpriteNode()
        line2.color = UIColor.lightGray
        line2.size = CGSize(width: 1, height: 40 * 20)
        line2.anchorPoint = CGPoint.zero
        line2.position = CGPoint(x: 40 * 10 + 2, y: 0)
        
        let line3 = SKSpriteNode()
        line3.color = UIColor.lightGray
        line3.size = CGSize(width: 40 * 10, height: 1)
        line3.anchorPoint = CGPoint.zero
        line3.position = CGPoint(x: 0, y: -2)
        
        self.addChild(line1)
        self.addChild(line2)
        self.addChild(line3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func receiveShape(shape: TRSShape) {
        // receive blocks
        shape.removeFromParent()
        for block in shape.blocks! {
            block.left = shape.left + block.left
            block.top = shape.top + block.top
            block.removeFromParent()
            self.addChild(block)
            self.fixedBlocks.append(block)
        }
        
        // counter rowCount
        var rowCountDic = Dictionary<Int, Int>()
        for block in self.fixedBlocks {
            let row = block.top
            
            if rowCountDic.keys.contains(row) {
                let rowCount = rowCountDic[row]
                rowCountDic[row] = rowCount! + 1
            } else {
                rowCountDic[row] = 1
            }
        }
        
        // find full lines
        var fullLines = Array<Int>()
        for element in rowCountDic {
            if element.1 == 10 {
                fullLines.append(element.0)
            }
        }
        
        // kill full lines
        fullLines.sort()
        if fullLines.count > 0 {
            
            for i in 0...fullLines.count - 1 {
                let rowIndex = fullLines[fullLines.count - 1 - i]

                // find
                var tempKillBlocks = Array<TRSBrick>()
                for fixedBlock in self.fixedBlocks {
                    if fixedBlock.top == rowIndex {
                        tempKillBlocks.append(fixedBlock)
                    }
                }
                
                // remove
                for killBlock in tempKillBlocks {
                    killBlock.removeFromParent()
                    let idx = index(ofAccessibilityElement: killBlock)
                    self.fixedBlocks.remove(at: idx)
                    
                }
                
                // down the block
                for fixedBlock in self.fixedBlocks {
                    if fixedBlock.top > rowIndex {
                        fixedBlock.top -= 1
                        fixedBlock.setPosition()
                    }
                }
            }
        }
        
        if (self.killLinesBlock != nil && fullLines.count > 0){
            self.killLines += fullLines.count
            print("kill \(fullLines.count) lines")
            self.killLinesBlock!(fullLines.count)
        }
    }
    
    func setKillLinesBlock(killLinesBlock: @escaping ((Int) -> ())) {
        self.killLinesBlock = killLinesBlock
    }
    
    func reset() {
        self .removeChildren(in: self.fixedBlocks)
        self.fixedBlocks.removeAll()
        self.killLines = 0
    }
}
