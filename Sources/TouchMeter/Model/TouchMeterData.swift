//
//  File.swift
//  
//
//  Created by Office on 2/5/23.
//

import Foundation
import CoreMotion

@objc public enum DataType : Int {
    case touch
    case accelerometer
}

@objc public class TouchLoc: NSObject {
    @objc public let x: Float
    @objc public let y: Float
    
    init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
}

public class TouchMeterData: NSObject {
    @objc public let type: DataType
    @objc public let time: Date
    @objc public let data: AnyObject
    
    init(type: DataType, time: Date, data: AnyObject) {
        self.type = type
        self.time = time
        self.data = data
    }
}
