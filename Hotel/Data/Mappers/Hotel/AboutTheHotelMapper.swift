//
//  AboutTheHotelMapper.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

struct AboutTheHotelMapper: Mapper {
    typealias Response = AboutTheHotelResponse
    typealias Domain = AboutTheHotelDomain

    func call(_ response: Response) -> Domain {
        .init(
            description: response.description,
            peculiarities: response.peculiarities
        )
    }
}
