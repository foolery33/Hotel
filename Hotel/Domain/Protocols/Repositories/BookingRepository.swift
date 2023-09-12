//
//  BookingRepository.swift
//  Hotel
//
//  Created by Nikita Usov on 11.09.2023.
//

import Foundation

protocol BookingRepository {
    func getBookingInformation(
        completion: @escaping (
            (Result<BookingDomain, Error>) -> Void
        )
    )
}
