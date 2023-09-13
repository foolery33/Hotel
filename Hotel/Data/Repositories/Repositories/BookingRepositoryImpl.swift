//
//  BookingRepositoryImpl.swift
//  Hotel
//
//  Created by Nikita Usov on 11.09.2023.
//

import Foundation

final class BookingRepositoryImpl {

    // MARK: - Private Properties

    private let bookingService: BookingService

    private let bookingMapper: BookingMapper

    // MARK: - Init

    public init(
        bookingService: BookingService,
        bookingMapper: BookingMapper
    ) {
        self.bookingService = bookingService
        self.bookingMapper = bookingMapper
    }

}

// MARK: - HotelRepository

extension BookingRepositoryImpl: BookingRepository {
    func getBookingInformation(
        completion: @escaping (
            (Result<BookingDomain, Error>) -> Void
        )
    ) {
        bookingService.getBookingInformation { [weak self] result in
            switch result {
            case .success(let response):
                completion(
                    .success(
                        self?.bookingMapper.call(response) ?? .init()
                    )
                )

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
