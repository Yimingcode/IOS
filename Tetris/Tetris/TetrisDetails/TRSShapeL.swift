//
//  TRSShapeL.swift
//  TetrisLite
//
//  Created by 徐一鸣 on 4/10/19.
//  Copyright © 2019 YimingXu. All rights reserved.
//

import UIKit

class TRSShapeL: TRSShape {
    
    static let array: Array<NSArray> = [
        [
            0, 1, 0, 0,
            0, 1, 0, 0,
            0, 1, 1, 0,
            0, 0, 0, 0
        ],
        [
            1, 1, 1, 0,
            1, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0
        ],
        [
            0, 1, 1, 0,
            0, 0, 1, 0,
            0, 0, 1, 0,
            0, 0, 0, 0
        ],
        [
            0, 0, 1, 0,
            1, 1, 1, 0,
            0, 0, 0, 0,
            0, 0, 0, 0
        ]
    ]
    override var statusArray: Array<NSArray>? {
        set {
            self.statusArray = newValue
        }
        get {
            return TRSShapeL.array
        }
    }
}
