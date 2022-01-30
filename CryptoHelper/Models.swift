//
//  Models.swift
//  CryptoHelper
//
//  Created by admin1 on 29.01.2022.
//

import Foundation

struct Crypto: Codable {
    let id: String
    let currency: String
    let symbol: String
    let name: String
    let price: String
}
