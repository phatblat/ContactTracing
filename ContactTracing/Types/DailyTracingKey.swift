//
//  DailyTracingKey.swift
//  ContactTracing
//
//  Created by Ben Chatelain on 4/12/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

import CryptoKit

/// A Daily Tracing Key is generated for every 24-hour window where the protocol is advertising.
/// From the Tracing Key, we derive the 16-byte Daily Tracing Key in the following way:
///   dtki ←HKDF(tk,NULL,(UTF8("CT-DTK")||Di),16)
/// where Di is the DayNumber for the 24-hour window the broadcast is in.
/// Upon a user testing positive, the Daily Tracing Keys for days where the user could have been affected
/// are derived on the device from the Tracing Key. We refer to that subset of keys as the Diagnosis Keys.
/// If a user remains healthy and never tests positive, these Daily Tracing Keys never leave the device.
/// The use of 16-byte keys allows to limit the server and device requirements for the transfer and storage
/// of the Diagnosis Keys while preserving low false positive probabilities.
struct DailyTracingKey {
    let prefix = "CT-DTK"
    let size = 16
    let key: SymmetricKey
    let date: Date
    let dayNumber: DayNumber

    /// <#Description#>
    /// - Parameters:
    ///   - tracingKey: <#tracingKey description#>
    ///   - dayNumber: <#dayNumber description#>
    init(tracingKey: TracingKey, dayNumber: DayNumber) {
        // Concatenate prefix with day number
        let info = "\(prefix)\(dayNumber)".data(using: .utf8)!

//        guard let data = hkdf_sha256(tracingKey.key.dataRepresentation, salt: nil, info: info, outputSize: size) else { fatalError() }

        guard let data = tracingKey.secret.hkdfDerivedSymmetricKey(using: <#T##HashFunction.Protocol#>, salt: <#T##DataProtocol#>, sharedInfo: <#T##DataProtocol#>, outputByteCount: <#T##Int#>)
            , salt: nil, info: info, outputSize: size) else { fatalError() }
        key = SymmetricKey(data: data)

        self.date = Date()
        self.dayNumber = dayNumber
    }

    /// https://gist.github.com/dcwatson/27b64c3a3b81730521401df8037a4696
    /// - Parameters:
    ///   - seed: <#seed description#>
    ///   - salt: <#salt description#>
    ///   - info: <#info description#>
    ///   - outputSize: Size of resulting data in bytes.
    /// - Returns: <#description#>
    func hkdf_sha256(_ seed: Data, salt: Data, info: Data, outputSize: Int = 32) -> Data? {
        // It would be nice to make this generic over <H: HashFunction> if HashFunction had byteCount instead of each hash
        // individually implementing it.
        let iterations = UInt8(ceil(Double(outputSize) / Double(SHA256.byteCount)))
        guard iterations <= 255 else {
            return nil
        }

        let prk = HMAC<SHA256>.authenticationCode(for: seed, using: SymmetricKey(data: salt))
        let key = SymmetricKey(data: prk)
        var hkdf = Data()
        var value = Data()

        for i in 1...iterations {
            value.append(info)
            value.append(i)

            let code = HMAC<SHA256>.authenticationCode(for: value, using: key)
            hkdf.append(contentsOf: code)

            value = Data(code)
        }

        return hkdf.prefix(outputSize)
    }
}
