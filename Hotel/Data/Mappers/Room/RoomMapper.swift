//
//  RoomMapper.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

struct RoomMapper: Mapper {
    typealias Response = RoomResponse
    typealias Domain = RoomDomain

    func call(_ response: Response) -> Domain {
        .init(
            id: response.id,
            name: response.name,
            price: response.price,
            pricePer: response.pricePer,
            peculiarities: response.peculiarities,
            imageUrls: response.imageUrls
        )
    }
}
