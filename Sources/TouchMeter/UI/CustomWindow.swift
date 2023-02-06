//
//  File 3.swift
//  
//
//  Created by Office on 2/5/23.
//

import Foundation

import UIKit

@objc public class CustomWindow: UIWindow {
    public override func sendEvent(_ event: UIEvent){
        super.sendEvent(event)
        TouchMeter.shared.logTouchData(event: event)
    }
}
