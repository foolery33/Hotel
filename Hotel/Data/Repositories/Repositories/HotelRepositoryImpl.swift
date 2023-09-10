//
//  HotelRepositoryImpl.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

final class HotelRepositoryImpl {

    // MARK: - Private Properties

    private let hotelService: HotelService

    private let hotelMapper: HotelMapper

    // MARK: - Init

    public init(
        hotelService: HotelService,
        hotelMapper: HotelMapper
    ) {
        self.hotelService = hotelService
        self.hotelMapper = hotelMapper
    }

}

// MARK: - HotelRepository

extension HotelRepositoryImpl: HotelRepository {
    func getHotel(
        completion: @escaping (
            (Result<HotelDomain, Error>) -> Void
        )
    ) {
        hotelService.getHotel { [weak self] result in
            switch result {
            case .success(let response):
                completion(
                    .success(
                        self?.hotelMapper.call(response) ?? .init()
                    )
                )

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
