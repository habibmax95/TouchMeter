# TouchMeter
Log touch location and accelerometer data.

# Technical information :
- Development Language Used : Swift 5
- Current Version : 1.0
- Build : 1
- Deployment target : iOS 14.2
- XcodeVersion : 14.2
- Supported Devices : iPhone

# Steps to add the package:
1. Open your project in Xcode.
2. Go to File -> Add packages..
3. In the package window tap "Add local".
4. Browse the package and tap "Add local" button.
5. Clean and build the proect.

# How to use:
In Objective-C,
Add the following line in your AppDelegate didFinishLaunchingWithOptions method to facilate touch capturing
```
// setting custom window to capture touch events
self.window = [[CustomWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
```

To start capturing touch and accelerometer data
```
// accessing TouchMeter singleton shared instance
TouchMeter *touchMeter = [TouchMeter shared];

// invoking startLoggingData method to initiate the touch and accelerometer data capturing
[touchMeter startLoggingData];
```

To stop capturing touch and accelerometer data
```
// accessing TouchMeter singleton shared instance
TouchMeter *touchMeter = [TouchMeter shared];

// invoking startLoggingData method to initiate the touch and accelerometer data capturing
[touchMeter stopLoggingData];
```

To get captured data sorted by time
```
// accessing TouchMeter singleton shared instance
TouchMeter *touchMeter = [TouchMeter shared];

// getting captured touch and accelerometer data
NSArray *touchMeterDatas = [touchMeter getTouchMeterDatas];
```

UseCase
```
for (TouchMeterData *data in touchMeterDatas) {
    if (data.type == DataTypeTouch && [data.data isKindOfClass:[TouchLoc class]]) {
        TouchLoc *touchData = (TouchLoc *)data.data;
        NSLog(@"BEHAVIO:: touch data:: %f %f", touchData.x, touchData.y);
    } else if (data.type == DataTypeAccelerometer && [data.data isKindOfClass:[CMAccelerometerData class]]) {
        CMAcceleration acceleration = ((CMAccelerometerData *)data.data).acceleration;
        NSLog(@"BEHAVIO:: acceleration data:: x: %f, y: %f, z: %f", acceleration.x, acceleration.y, acceleration.z);
    }
}
```


