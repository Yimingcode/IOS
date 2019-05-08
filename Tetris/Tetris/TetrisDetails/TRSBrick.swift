//
//  TRSBrick.swift
//  Tetris
//
//  Created by 徐一鸣 on 3/8/19.
//  Copyright © 2019 YimingXu. All rights reserved.
//

import SpriteKit

public class TRSBrick: SKSpriteNode {
    
    var left : Int = 0 {
        didSet {
            self.setPosition()
        }
    }
    var top : Int = 0 {
        didSet {
            self.setPosition()
        }
    }
    var width : CGFloat = 0.0 {
        didSet {
            self.setSize()
        }
    }
    var imageName : String? {
        didSet {
            if (imageName != nil) {
                self.texture = SKTexture(imageNamed: imageName!)
            }
        }
    }
    var fixed : Bool = false
    
    func setPosition() -> () {
        self.position = CGPoint(x: width * CGFloat(left), y: width * CGFloat(top))
    }
    
    func setSize() -> () {
        self.size = CGSize(width: width, height: width)
    }
    
    convenience init(left : Int, top : Int, width : CGFloat, imageName : String) {
        self.init(imageNamed : imageName)
        self.imageName = imageName
        self.left = left
        self.top = top
        self.width = width
        
        self.texture = SKTexture(imageNamed: imageName)
        self.setPosition()
        self.setSize()
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size:size)
    }
    
     public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeCInt(Int32(self.left), forKey:"left")
        aCoder.encodeCInt(Int32(self.top), forKey:"top")
        aCoder.encode(Float(self.width), forKey: "width")
        aCoder.encode(self.imageName, forKey: "imageName")
        aCoder.encode(self.anchorPoint, forKey: "anchorPoint")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.left = Int(aDecoder.decodeCInt(forKey: "left"));
        self.top = Int(aDecoder.decodeCInt(forKey: "top"));
        self.width = CGFloat(aDecoder.decodeFloat(forKey: "width"));
        self.imageName = aDecoder.decodeObject(forKey: "imageName") as! String?;
        self.anchorPoint = aDecoder.decodeCGPoint(forKey: "anchorPoint")
    }

    override public var description: String {

        return "left:\(left) top:\(top) width:\(width) imageName:\(String(describing: imageName))"
    }
}
