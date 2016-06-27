# RawIMU

[![GitHub license](https://img.shields.io/aur/license/yaourt.svg)](https://raw.githubusercontent.com/softwarenerd/RawIMU/master/LICENSE.md) ![platforms](https://img.shields.io/badge/platforms-iOS%20-lightgrey.svg)

RawIMU is a test program for the [Fused](https://github.com/softwarenerd/Fused) iOS framework. [Fused](https://github.com/softwarenerd/Fused) is an iOS Framework that contains Objective-C ports of the MadgwickAHRS and MahonyAHRS sensor fusion algorithms. The original C implementations of MadgwickAHRS and MahonyAHRS can be found [here](http://www.x-io.co.uk/res/sw/madgwick_algorithm_c.zip).

![RawIMU](Documentation/RawIMU.png)

## Getting Started

RawIMU uses [Carthage dependency manager](https://github.com/Carthage/Carthage). Follow the [Carthage build instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos) for building for iOS.

#### Clone RawIMU

`~/Code git clone git@github.com:softwarenerd/RawIMU.git`

## Logging

RawIMU provides detailed logging so you can compare its performance to CoreMotion.

```
-------------------------------------------------------------------------
CoreMotion Raw Data
-------------------------------------------------------------------------
     Gyroscope (rad/s): X:      0.00100, Y:      0.00008, Z:     -0.00129
     Gyroscope (deg/s): X:      0.05717, Y:      0.00466, Z:     -0.07409
     Accelerometer (g): X:     -0.00468, Y:      0.02273, Z:     -0.99973
     Magnetometer (uT): X:      2.56992, Y:    -26.00712, Z:    -37.02501
-------------------------------------------------------------------------
Sensor Fusion / CoreMotion Comparison
-------------------------------------------------------------------------
 Sensor Fusion Roll (deg):     -0.26764
    CoreMotion Roll (deg):     -0.26821
---------------------------------------
Sensor Fusion Pitch (deg):     -1.28492
   CoreMotion Pitch (deg):     -1.30249
---------------------------------------
  Sensor Fusion Yaw (deg):     84.16334
     CoreMotion Yaw (deg):     85.44150
```

## License

RawIMU is released under the [GNU General Public License](LICENSE.md).
