//
//  RollingProximityIdentifier.swift
//  ContactTracing
//
//  Created by Ben Chatelain on 4/12/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

/// The Rolling Proximity Identifiers are privacy-preserving identifiers that are sent in Bluetooth Advertisements.
/// Each time the Bluetooth MAC address changes, we derive a new Rolling Proximity Identifier:
///   RPIi,j ← Truncate(HMAC(dkti,(UTF8("CT-RPI")||TINj)),16)
/// Where:
///  • T I Nj is the TimeIntervalNumber for the time at which the BLE MAC address changes.
///  The 16-byte Rolling Proximity Identifier is broadcasted over Bluetooth LE. The use of 16-byte
///  identifiers yields a low probability of collisions and limits the risk of false positive matches, while
///  keeping device storage requirements low.
struct RollingProximityIdentifier {}
