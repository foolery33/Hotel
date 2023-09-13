//
//  HotelMapper.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

struct HotelMapper: Mapper {
    typealias Response = HotelResponse
    typealias Domain = HotelDomain

    func call(_ response: Response) -> Domain {
        .init(
            id: response.id,
            name: response.name,
            address: response.address,
            minimalPrice: response.minimalPrice,
            priceForIt: response.priceForIt,
            rating: response.rating,
            ratingName: response.ratingName,
            imageUrls: response.imageUrls,
            aboutTheHotel: AboutTheHotelMapper().call(response.aboutTheHotel)
        )
    }
}
