//
//  GetHotelUseCase.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

final class GetHotelUseCase {

    // MARK: - Private Properties

    private let hotelRepository: HotelRepository

    // MARK: - Init

    public init(hotelRepository: HotelRepository) {
        self.hotelRepository = hotelRepository
    }

    // MARK: - UseCase

    public func invoke(
        completion: @escaping (
            (Result<HotelDomain, Error>) -> Void
        )
    ) {
        hotelRepository.getHotel { result in
            switch result {
            case .success(let domain):
                completion(.success(domain))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
