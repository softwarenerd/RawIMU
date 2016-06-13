# RawIMU

[![GitHub license](https://img.shields.io/aur/license/yaourt.svg)](https://raw.githubusercontent.com/softwarenerd/RawIMU/master/LICENSE.md) ![platforms](https://img.shields.io/badge/platforms-iOS%20-lightgrey.svg)

RawIMU is a test program for the [MadgwickAHRS](https://github.com/softwarenerd/MadgwickAHRS) package. [MadgwickAHRS](http://www.x-io.co.uk/open-source-imu-and-ahrs-algorithms/) is a port of the [C implementation](http://www.x-io.co.uk/res/sw/madgwick_algorithm_c.zip) of MadgwickAHRS to an iOS Framework written in Objective-C.

![RawIMU](Documentation/RawIMU.png)

## Getting Started

RawIMU uses [Carthage dependency manager](https://github.com/Carthage/Carthage). Follow the [Carthage build instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos) for building for iOS.

#### Clone RawIMU

`~/Code git clone git@github.com:softwarenerd/RawIMU.git`

#### Optionally, Build Carthage Dependencies

```~/Code/RawIMU carthage bootstrap```

## Logging

RawIMU provides detailed logging so you can compare its performance to CoreMotion.

```
-------------------------------------------------------------------------
CoreMotion Raw Data
-------------------------------------------------------------------------
     Gyroscope (rad/s): X:     -0.00190, Y:      0.00046, Z:     -0.00012
     Gyroscope (deg/s): X:     -0.10902, Y:      0.02641, Z:     -0.00687
     Accelerometer (g): X:     -0.00713, Y:     -0.00180, Z:     -0.99997
     Magnetometer (uT): X:    -33.51311, Y:    -24.53882, Z:    -22.25294
-------------------------------------------------------------------------
Madgwick / CoreMotion Comparison
-------------------------------------------------------------------------
      Madgwick Roll (deg):    359.59784
    CoreMotion Roll (deg):    359.59158
---------------------------------------
     Madgwick Pitch (deg):      0.09470
   CoreMotion Pitch (deg):      0.10312
---------------------------------------
       Madgwick Yaw (deg):    143.78024
     CoreMotion Yaw (deg):    143.92413
```

## License

MadgwickAHRS is released under the [GNU General Public License](LICENSE.md).
