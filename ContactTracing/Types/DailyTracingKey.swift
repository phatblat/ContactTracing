//
//  DailyTracingKey.swift
//  ContactTracing
//
//  Created by Ben Chatelain on 4/12/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

/// A Daily Tracing Key is generated for every 24-hour window where the protocol is advertising.
/// From the Tracing Key, we derive the 16-byte Daily Tracing Key in the following way:
///   dtki ←HKDF(tk,NULL,(UTF8("CT-DTK")||Di),16)
/// where Di is the DayNumber for the 24-hour window the broadcast is in.
/// Upon a user testing positive, the Daily Tracing Keys for days where the user could have been affected
/// are derived on the device from the Tracing Key. We refer to that subset of keys as the Diagnosis Keys.
/// If a user remains healthy and never tests positive, these Daily Tracing Keys never leave the device.
/// The use of 16-byte keys allows to limit the server and device requirements for the transfer and storage
/// of the Diagnosis Keys while preserving low false positive probabilities.
struct DailyTracingKey {}
