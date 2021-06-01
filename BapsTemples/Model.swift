//
//  Model.swift
//  BapsTemples
//
//  Created by Shiv Bhagat on 5/26/21.
//

import Foundation

struct Result: Codable {
    let data: [ResultItem]
}

struct ResultItem:Codable {
    let address: [Double]
    let image: String
    let name: String
}
