//
//  HotelDomain.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

struct HotelDomain {
    let id: Int
    let name: String
    let address: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotelDomain

    init(
        id: Int,
        name: String,
        address: String,
        minimalPrice: Int,
        priceForIt: String,
        rating: Int,
        ratingName: String,
        imageUrls: [String],
        aboutTheHotel: AboutTheHotelDomain
    ) {
        self.id = id
        self.name = name
        self.address = address
        self.minimalPrice = minimalPrice
        self.priceForIt = priceForIt
        self.rating = rating
        self.ratingName = ratingName
        self.imageUrls = imageUrls
        self.aboutTheHotel = aboutTheHotel
    }

    init() {
        self.id = .init()
        self.name = .init()
        self.address = .init()
        self.minimalPrice = .init()
        self.priceForIt = .init()
        self.rating = .init()
        self.ratingName = .init()
        self.imageUrls = .init()
        self.aboutTheHotel = .init()
    }
}
