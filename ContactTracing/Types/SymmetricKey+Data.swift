//
//  SymmetricKey+Data.swift
//  ContactTracing
//
//  Created by Ben Chatelain on 4/12/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

import CryptoKit

extension SymmetricKey {
    /// Builds a Data struct with the underlying bytes.
    var data: Data {
        withUnsafeBytes { Data($0) }
    }
}
