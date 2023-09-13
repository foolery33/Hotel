//
//  HotelService.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

protocol HotelService {
    func getHotel(
        completion: @escaping (
            (Result<HotelResponse, Error>) -> Void
        )
    )
}
