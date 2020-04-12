//
//  TracingKey.swift
//  ContactTracing
//
//  Created by Ben Chatelain on 4/12/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//


/// The Tracing Key is generated when contact tracing is enabled on the device and is securely stored on the device.
/// The 32-byte Tracing Key is derived as follows:
/// tk ← CRNG(32)
/// The Tracing Key never leaves the device.
struct TracingKey {}
