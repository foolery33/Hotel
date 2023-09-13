//
//  GetBookingInformationUseCase.swift
//  Hotel
//
//  Created by Nikita Usov on 11.09.2023.
//

import Foundation

final class GetBookingInformationUseCase {

    // MARK: - Private Properties

    private let bookingRepository: BookingRepository

    // MARK: - Init

    public init(bookingRepository: BookingRepository) {
        self.bookingRepository = bookingRepository
    }

    // MARK: - UseCase

    public func invoke(
        completion: @escaping (
            (Result<BookingDomain, Error>) -> Void
        )
    ) {
        bookingRepository.getBookingInformation { result in
            switch result {
            case .success(let domain):
                completion(.success(domain))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
