//
//  RoomDomain.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

struct RoomDomain: Identifiable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    init(
        id: Int,
        name: String,
        price: Int,
        pricePer: String,
        peculiarities: [String],
        imageUrls: [String]
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.pricePer = pricePer
        self.peculiarities = peculiarities
        self.imageUrls = imageUrls
    }

    init() {
        self.id = .init()
        self.name = .init()
        self.price = .init()
        self.pricePer = .init()
        self.peculiarities = .init()
        self.imageUrls = .init()
    }
}
