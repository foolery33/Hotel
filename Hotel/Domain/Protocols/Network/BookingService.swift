//
//  BookingService.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

protocol BookingService {
    func getBookingInformation(
        completion: @escaping (
            (Result<BookingResponse, Error>) -> Void
        )
    )
}
