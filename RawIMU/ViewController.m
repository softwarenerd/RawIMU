//
//  ViewController.m
//  RawIMU
//
//  Created by Brian Lambert on 6/6/16.
//  Copyright © 2016 Brian Lambert. All rights reserved.
//

#import <Fused/Fused.h>
#import "ViewController.h"

// Executes the specified block on the main thread.
static inline void OnMainThread(dispatch_block_t block)
{
    dispatch_async(dispatch_get_main_queue(), block);
}

// ViewController (CoreMotionTestDriverDelegate) interface.
@interface ViewController (CoreMotionTestDriverDelegate) <CoreMotionTestDriverDelegate>
@end

// ViewController (Internal) interface.
@interface ViewController (Internal)

- (IBAction)switchRunningValueChanged:(UISwitch *)sender;

@end

// The ViewController interface.
@implementation ViewController
{
@private
    // The number formatter used for formatting numbers for logging.
    NSNumberFormatter * _numberFormatterLogging;
    
    // The number formatter used for formatting numbers for display.
    NSNumberFormatter * _numberFormatterDisplay;

    // The samples array that is dumped when a run ends.
    NSMutableArray<NSDictionary *> * _samplesArray;

    // The CoreMotionTestDriver.
    CoreMotionTestDriver * _coreMotionTestDriver;
    
    // The gyroscope X label.
    IBOutlet UILabel * _labelGX;
    
    // The gyroscope Y label.
    IBOutlet UILabel * _labelGY;
    
    // The gyroscope Z label.
    IBOutlet UILabel * _labelGZ;
    
    // The accelerometer X label.
    IBOutlet UILabel * _labelAX;
    
    // The accelerometer Y label.
    IBOutlet UILabel * _labelAY;
    
    // The accelerometer Z label.
    IBOutlet UILabel * _labelAZ;
    
    // The magnetometer X label.
    IBOutlet UILabel * _labelMX;
    
    // The magnetometer Y label.
    IBOutlet UILabel * _labelMY;
    
    // The magnetometer Z label.
    IBOutlet UILabel * _labelMZ;
    
    // The CoreMotion roll label.
    IBOutlet UILabel * _labelCoreMotionRoll;
    
    // The CoreMotion pitch label.
    IBOutlet UILabel * _labelCoreMotionPitch;
    
    // The CoreMotion yaw label.
    IBOutlet UILabel * _labelCoreMotionYaw;

    // The Madgwick roll label.
    IBOutlet UILabel * _labelMadgwickRoll;

    // The Madgwick pitch label.
    IBOutlet UILabel * _labelMadgwickPitch;
    
    // The Madgwick yaw label.
    IBOutlet UILabel * _labelMadgwickYaw;
    
    // The running switch.
    IBOutlet UISwitch * _switchRunning;
}

// Called when the view loads.
- (void)viewDidLoad
{
    // Call the base class's method.
    [super viewDidLoad];
    
    // Allocate and initialize the number formatter.
    _numberFormatterLogging = [[NSNumberFormatter alloc] init];
    [_numberFormatterLogging setFormatWidth:12];
    [_numberFormatterLogging setMinimumFractionDigits:5];
    [_numberFormatterLogging setMinimumFractionDigits:5];
    [_numberFormatterLogging setMinimumIntegerDigits:1];
    [_numberFormatterLogging setMaximumIntegerDigits:5];
    [_numberFormatterLogging setPaddingCharacter:@" "];
    
    // Allocate and initialize the number formatter.
    _numberFormatterDisplay = [[NSNumberFormatter alloc] init];
    [_numberFormatterDisplay setMinimumFractionDigits:3];
    [_numberFormatterDisplay setMinimumFractionDigits:3];
    [_numberFormatterDisplay setMinimumIntegerDigits:1];
    [_numberFormatterDisplay setMaximumIntegerDigits:5];
    [_numberFormatterDisplay setPositivePrefix:@"+"];
    [_numberFormatterDisplay setPaddingCharacter:@" "];
}

// Called when there is a memory warning.
- (void)didReceiveMemoryWarning
{
    [CoreMotionTestDriver degreesFromRadians:20];

    // Call the base class's method.
    [super didReceiveMemoryWarning];
}

@end

// ViewController (CoreMotionTestDriverDelegate) interface.
@implementation ViewController (CoreMotionTestDriverDelegate)

// Notifies the delegate of an update.
- (void)coreMotionTestDriver:(CoreMotionTestDriver *)coreMotionTestDriver
         didUpdateGyroscopeX:(float)gx
                  gyroscopeY:(float)gy
                  gyroscopeZ:(float)gz
              accelerometerX:(float)ax
              accelerometerY:(float)ay
              accelerometerZ:(float)az
               magnetometerX:(float)mx
               magnetometerY:(float)my
               magnetometerZ:(float)mz
                          q0:(float)q0
                          q1:(float)q1
                          q2:(float)q2
                          q3:(float)q3
                        roll:(float)roll
                       pitch:(float)pitch
                         yaw:(float)yaw
              coreMotionRoll:(float)coreMotionRoll
             coreMotionPitch:(float)coreMotionPitch
               coreMotionYaw:(float)coreMotionYaw
{
    [_samplesArray addObject:@{@"gx":               @(gx),
                               @"gy":               @(gy),
                               @"gz":               @(gz),
                               @"ax":               @(ax),
                               @"ay":               @(ay),
                               @"az":               @(az),
                               @"mx":               @(mx),
                               @"my":               @(my),
                               @"mz":               @(mz),
                               @"roll":             @(roll),
                               @"pitch":            @(pitch),
                               @"yaw":              @(yaw),
                               @"coreMotionRoll":   @(coreMotionRoll),
                               @"coreMotionPitch":  @(coreMotionPitch),
                               @"coreMotionYaw":    @(coreMotionYaw)}];
    
    OnMainThread(^{
        [_labelGX setText:[_numberFormatterDisplay stringFromNumber:@(gx)]];
        [_labelGY setText:[_numberFormatterDisplay stringFromNumber:@(gy)]];
        [_labelGZ setText:[_numberFormatterDisplay stringFromNumber:@(gz)]];

        [_labelAX setText:[_numberFormatterDisplay stringFromNumber:@(ax)]];
        [_labelAY setText:[_numberFormatterDisplay stringFromNumber:@(ay)]];
        [_labelAZ setText:[_numberFormatterDisplay stringFromNumber:@(az)]];

        [_labelMX setText:[_numberFormatterDisplay stringFromNumber:@(mx)]];
        [_labelMY setText:[_numberFormatterDisplay stringFromNumber:@(my)]];
        [_labelMZ setText:[_numberFormatterDisplay stringFromNumber:@(mz)]];
        
        [_labelCoreMotionRoll setText:[_numberFormatterDisplay stringFromNumber:@(coreMotionRoll)]];
        [_labelCoreMotionPitch setText:[_numberFormatterDisplay stringFromNumber:@(coreMotionPitch)]];
        [_labelCoreMotionYaw setText:[_numberFormatterDisplay stringFromNumber:@(coreMotionYaw)]];

        [_labelMadgwickRoll setText:[_numberFormatterDisplay stringFromNumber:@(roll)]];
        [_labelMadgwickPitch setText:[_numberFormatterDisplay stringFromNumber:@(pitch)]];
        [_labelMadgwickYaw setText:[_numberFormatterDisplay stringFromNumber:@(yaw)]];
    });
    
    // Logging.
    NSLog(@" ");
    NSLog(@"-------------------------------------------------------------------------");
    NSLog(@"CoreMotion Raw Data");
    NSLog(@"-------------------------------------------------------------------------");
    NSLog(@"     Gyroscope (rad/s): X: %@, Y: %@, Z: %@", [_numberFormatterLogging stringFromNumber:@(gx)],
                                                          [_numberFormatterLogging stringFromNumber:@(gy)],
                                                          [_numberFormatterLogging stringFromNumber:@(gz)]);
    NSLog(@"     Gyroscope (deg/s): X: %@, Y: %@, Z: %@", [_numberFormatterLogging stringFromNumber:@([CoreMotionTestDriver degreesFromRadians:gx])],
                                                          [_numberFormatterLogging stringFromNumber:@([CoreMotionTestDriver degreesFromRadians:gy])],
                                                          [_numberFormatterLogging stringFromNumber:@([CoreMotionTestDriver degreesFromRadians:gz])]);
    NSLog(@"     Accelerometer (g): X: %@, Y: %@, Z: %@", [_numberFormatterLogging stringFromNumber:@(ax * -1.0)],
                                                          [_numberFormatterLogging stringFromNumber:@(ay * -1.0)],
                                                          [_numberFormatterLogging stringFromNumber:@(az * -1.0)]);
    NSLog(@"     Magnetometer (uT): X: %@, Y: %@, Z: %@", [_numberFormatterLogging stringFromNumber:@(mx)],
                                                          [_numberFormatterLogging stringFromNumber:@(my)],
                                                          [_numberFormatterLogging stringFromNumber:@(mz)]);
    NSLog(@"-------------------------------------------------------------------------");
    NSLog(@"Madgwick / CoreMotion Comparison");
    NSLog(@"-------------------------------------------------------------------------");
    NSLog(@"      Madgwick Roll (deg): %@", [_numberFormatterLogging stringFromNumber:@(roll)]);
    NSLog(@"    CoreMotion Roll (deg): %@", [_numberFormatterLogging stringFromNumber:@(coreMotionRoll)]);
    NSLog(@"---------------------------------------");
    NSLog(@"     Madgwick Pitch (deg): %@", [_numberFormatterLogging stringFromNumber:@(pitch)]);
    NSLog(@"   CoreMotion Pitch (deg): %@", [_numberFormatterLogging stringFromNumber:@(coreMotionPitch)]);
    NSLog(@"---------------------------------------");
    NSLog(@"       Madgwick Yaw (deg): %@", [_numberFormatterLogging stringFromNumber:@(yaw)]);
    NSLog(@"     CoreMotion Yaw (deg): %@", [_numberFormatterLogging stringFromNumber:@(coreMotionYaw)]);
}

@end

// ViewController (Internal) implementation.
@implementation ViewController (Internal)

// Running switch value changed.
- (IBAction)switchRunningValueChanged:(UISwitch *)sender
{
    // If the switch is on, start test; otherwise, stop it and dump the samples.
    if ([_switchRunning isOn])
    {
        _samplesArray = [[NSMutableArray<NSDictionary *> alloc] init];
        
#if false
        _coreMotionTestDriver = [[CoreMotionTestDriver alloc] initMadgwickSensorFusionWithSampleFrequencyHz:10.0f
                                                                                                       beta:0.6045997880780726f];
#else
        _coreMotionTestDriver = [[CoreMotionTestDriver alloc] initMahonySensorFusionWithSampleFrequencyHz:10.0f
                                                                                                    twoKp:2.0f * 0.5f
                                                                                                    twoKi:2.0f * 0.0f];
#endif
        [_coreMotionTestDriver setDelegate:(id<CoreMotionTestDriverDelegate>)self];
        [_coreMotionTestDriver start];
    }
    else
    {
        [_coreMotionTestDriver stop];
        _coreMotionTestDriver = nil;
        NSError * error;
        NSData * data = [NSJSONSerialization dataWithJSONObject:_samplesArray
                                                        options:0
                                                          error:&error];
        if (!error)
        {
            NSString * samplesJSON = [[NSString alloc] initWithData:data
                                                           encoding:NSUTF8StringEncoding];
            NSLog(@"JSONS samples!\n%@", samplesJSON);
        }
        _samplesArray = nil;
    }
}

@end
