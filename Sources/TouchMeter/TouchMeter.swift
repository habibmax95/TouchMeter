import UIKit
import CoreMotion

@objc(TouchMeter)
public class TouchMeter: NSObject {
    public var accelerometerUpdateInterval = 1.0
    @objc public static let shared = TouchMeter()
    private let manager = CMMotionManager()
    private var datas = [TouchMeterData]()
    private var timer: Timer?
    private var shouldLogTouchEvent = false
    
    private override init() {
        super.init()
    }
    
    @objc public func startLoggingData() {
        shouldLogTouchEvent = true
        startAccelerometerUpdate()
    }
    
    @objc public func stopLoggingData() {
        shouldLogTouchEvent = false
        stopAccelerometerUpdate()
    }
    
    func startAccelerometerUpdate() {
        if !manager.isAccelerometerAvailable {
            return
        }
        manager.startAccelerometerUpdates()
        timer = Timer.scheduledTimer(withTimeInterval: accelerometerUpdateInterval, repeats: true) { [self] _ in
            if let data = self.manager.accelerometerData {
               // Use the accelerometer data in your app.
                print("Application received acc data \(data)")
                self.datas.append(TouchMeterData(type: .accelerometer, time: Date(), data: data))
            }
        }
    }
    
    func stopAccelerometerUpdate() {
        timer?.invalidate()
    }
    
    func logTouchData(event: UIEvent) {
        if !shouldLogTouchEvent {
            return
        }
        
        guard let allTouches = event.allTouches else {
            print("No touch events")
            return
        }
        
        for touch in allTouches {
            let window = touch.window
            let touchLoc = touch.location(in: window)
            print(("Application received \(touchLoc)"))
            self.datas.append(TouchMeterData(type: .touch, time: Date(), data: TouchLoc(x: Float(touchLoc.x), y: Float(touchLoc.y))))
        }
    }
    
    @objc public func getTouchMeterDatas() -> [TouchMeterData] {
        return datas.sorted{ $0.time > $1.time }
    }
}
