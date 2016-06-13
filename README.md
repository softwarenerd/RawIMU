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

## License

MadgwickAHRS is released under the [GNU General Public License](LICENSE.md).
