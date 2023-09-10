//
//  HotelRepository.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

protocol HotelRepository {
    func getHotel(
        completion: @escaping (
            (Result<HotelDomain, Error>) -> Void
        )
    )
}
