//
//  AboutTheHotelResponse.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

struct AboutTheHotelResponse: Decodable {
    let description: String
    let peculiarities: [String]
}
