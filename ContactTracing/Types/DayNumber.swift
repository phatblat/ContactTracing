//
//  DayNumber.swift
//  ContactTracing
//
//  Created by Ben Chatelain on 4/12/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

/// Provides a number for each 24-hour window. These time windows are based on Unix Epoch Time.
/// DayNumber ← Number of Seconds since Epoch / 60 × 60 × 24
/// DayNumber is encoded as a 32-bit (uint32_t) unsigned little-endian value.
typealias DayNumber = UInt32
