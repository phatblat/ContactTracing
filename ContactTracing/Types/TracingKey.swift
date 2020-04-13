//
//  TracingKey.swift
//  ContactTracing
//
//  Created by Ben Chatelain on 4/12/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

import CryptoKit

/// The Tracing Key is generated when contact tracing is enabled on the device and is securely stored on the device.
/// The 32-byte Tracing Key is derived as follows:
///   tk ← CRNG(32)
/// The Tracing Key never leaves the device.
struct TracingKey {
    let secret: SharedSecret
    let key: SymmetricKey
    let date: Date

    init() {
        secret = Curve25519.KeyAgreement.PrivateKey().sharedSecretFromKeyAgreement(with: <#T##Curve25519.KeyAgreement.PublicKey#>)
        key = SymmetricKey(size: .bits128)
        date = Date()
    }
}
