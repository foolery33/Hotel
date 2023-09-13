//
//  BookingServiceImpl.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Moya
import Foundation

final class BookingServiceImpl: BaseNetworkService {

    // MARK: - Private Properties

    private let client: MoyaProvider<BookingEndpoint>

    private let jsonDecoder: JSONDecoder = .init()

    // MARK: - Init

    public init(client: MoyaProvider<BookingEndpoint>) {
        self.client = client
    }

}

// MARK: - HotelService

extension BookingServiceImpl: BookingService {
    func getBookingInformation(
        completion: @escaping (
            (Result<BookingResponse, Error>) -> Void
        )
    ) {
        client.request(.getBookingInformation) { [weak self] moyaResult in
            guard let result = self?.handlerResponse(
                result: moyaResult,
                outputModel: BookingResponse.self
            ) else {
                return
            }

            switch result {
            case .success(let response):
                completion(.success(response))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
