//
//  TimeIntervalNumber.swift
//  ContactTracing
//
//  Created by Ben Chatelain on 4/12/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//


/// Provides a number for each 10-minute window in a 24-hour window as defined by DayNumber.
/// This value will be in the [0,143] interval.
/// TimeNumberInterval ← Seconds Since Start of DayNumber / 60×10
/// where : Seconds Since Start of DayNumber ← Number of Seconds since Epoch % (60*60*24)
/// TimeNumberInterval is encoded as a 8-bit (uint8_t) value.
typealias TimeIntervalNumber = UInt8
