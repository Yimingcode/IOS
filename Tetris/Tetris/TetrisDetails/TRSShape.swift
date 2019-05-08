//
//  TRSShape.swift
//  TetrisLite
//
//  Created by 徐一鸣 on 4/8/19.
//  Copyright © 2019 YimingXu. All rights reserved.
//

import SpriteKit

public class TRSShape : SKSpriteNode {
    
    public var left: Int = 0 {
        didSet {
            self.setPosition()
        }
    }
    public  var top: Int = 0 {
        didSet {
            self.setPosition()
        }
    }
    public var statusIndex: Int = 0
    public var imageName: String?
    public var unitWidth: CGFloat = 0
    public var blocks: Array<TRSBrick>? = Array<TRSBrick>()
    public var statusArray: Array<NSArray>? = nil
    public var minBlockLeft: Int = 4
    public var maxBlockLeft: Int = 0
    public var minBlockTop: Int = 4
    public var maxBlockTop: Int = 0
    
   required public init(left: Int, top: Int, statusIndex: Int, imageName: String, unitWidth: CGFloat) {
    super.init(texture: nil, color: UIColor.clear, size: CGSize.zero)
        self.left = left
        self.top = top
        self.statusIndex = statusIndex;
        self.imageName = imageName;
        self.unitWidth = unitWidth;
        
        self.setPosition();
        self.anchorPoint = CGPoint.zero
        
        self.setChildBlocks()
    }
    
    func moveLeft() {
        left -= 1
        print("\(self.classForCoder) move left to \(left)")
    }
    func moveUp() {
        top += 1
        print("\(self.classForCoder) move top to \(top)")
    }
    func moveRight() {
        left += 1
        print("\(self.classForCoder) move right to \(left)")
    }
    func moveDown() {
        top -= 1
//        print("\(self.classForCoder) move down to \(top)")
    }
    
    func clockwise(offsetLeft: Int, offsetTop:Int, isTemp: Bool) {
        if !isTemp {
            print("\(self.classForCoder) rotate clockwise")
        }
        
        self.left += offsetLeft;
        self.top += offsetTop;
        
        self.statusIndex += 1
        self.setChildBlocks() // ...
    }
    
    func setChildBlocks() {
        
        if (self.blocks != nil && self.blocks!.count > 0) {
            for block in self.blocks! {
                block.removeFromParent()
            }
            self.blocks?.removeAll()
        }
        
        if self.statusArray == nil {
            return
        }
        
        var minLeft = 4
        var maxLeft = 0
        var minTop = 4
        var maxTop = 0
        
        let currentIndex = (statusIndex + statusArray!.count) % statusArray!.count
        let currentArray = self.statusArray![currentIndex]
        let count = currentArray.count
        for index in 0...(count - 1) {
            let blockValue = (currentArray[index] as AnyObject).integerValue
            if blockValue == 1 {
                let left = index % 4
                let top = 3 - (index / 4)
                let brick = TRSBrick(left: left, top: top, width: self.unitWidth, imageName: self.imageName!)
                brick.anchorPoint = CGPoint.zero
                self.addChild(brick)
                self.blocks?.append(brick)
                
                if left < minLeft {
                    minLeft = left
                }
                if left > maxLeft {
                maxLeft = left
                }
                if top < minTop {
                    minTop = top
                }
                if top > maxTop {
                    maxTop = top
                }
            }
        }
        
        self.minBlockLeft = minLeft
        self.maxBlockLeft = maxLeft
        self.minBlockTop = minTop
        self.maxBlockTop = maxTop
    }
    
    func copyShadow() -> (TRSShape) {

       let shadow = TRSShape.init(left: self.left, top: self.top, statusIndex: self.statusIndex, imageName: self.imageName!, unitWidth: self.unitWidth)
        shadow.statusArray = self.statusArray
        shadow.setChildBlocks()
        
        shadow.alpha = 0.2
        return shadow;
    }
    
    func copyRotateShape(isClockWise: Bool) -> TRSShape {

        let rotateIndex = (statusIndex + statusArray!.count + (isClockWise ? 1 : -1)) % statusArray!.count
        
        let rotateShape = TRSShape.init(left: self.left, top: self.top, statusIndex: rotateIndex, imageName: self.imageName!, unitWidth: self.unitWidth)
        rotateShape.statusArray = self.statusArray
        rotateShape.setChildBlocks()
        
        return rotateShape
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeCInt(Int32(self.left), forKey:"left")
        aCoder.encodeCInt(Int32(self.top), forKey:"top")
        aCoder.encodeCInt(Int32(self.statusIndex), forKey: "statusIndex")
        aCoder.encode(self.imageName, forKey: "imageName")
        aCoder.encode(Float(self.unitWidth), forKey: "unitWidth")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.left = Int(aDecoder.decodeCInt(forKey: "left"));
        self.top = Int(aDecoder.decodeCInt(forKey: "top"));
        self.statusIndex = Int(aDecoder.decodeCInt(forKey: "statusIndex"));
        self.imageName = aDecoder.decodeObject(forKey: "imageName") as! String?;
        self.unitWidth = CGFloat(aDecoder.decodeFloat(forKey: "unitWidth"))
        self.anchorPoint = CGPoint.zero
    }
    
    func setPosition() -> () {
        self.position = CGPoint(x: unitWidth * CGFloat(left), y: unitWidth * CGFloat(top))
    }
    
    override public var description: String {
        return "status:\(statusIndex) left:\(left) top:\(top) unitWidth:\(unitWidth) imageName:\(String(describing: imageName))"
    }
}
