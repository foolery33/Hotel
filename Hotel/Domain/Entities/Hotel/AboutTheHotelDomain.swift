//
//  AboutTheHotelDomain.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

struct AboutTheHotelDomain {
    let description: String
    let peculiarities: [String]

    init(
        description: String,
        peculiarities: [String]
    ) {
        self.description = description
        self.peculiarities = peculiarities
    }

    init() {
        self.description = .init()
        self.peculiarities = .init()
    }
}
