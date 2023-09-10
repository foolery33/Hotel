//
//  HotelServiceImpl.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Moya
import Foundation

final class HotelServiceImpl: BaseNetworkService {

    // MARK: - Private Properties

    private let client: MoyaProvider<HotelEndpoint>

    private let jsonDecoder: JSONDecoder = .init()

    // MARK: - Init

    public init(client: MoyaProvider<HotelEndpoint>) {
        self.client = client
    }

}

// MARK: - HotelService

extension HotelServiceImpl: HotelService {
    func getHotel(
        completion: @escaping (
            (Result<HotelResponse, Error>) -> Void
        )
    ) {
        client.request(.getHotel) { [weak self] moyaResult in
            guard let result = self?.handlerResponse(
                result: moyaResult,
                outputModel: HotelResponse.self
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
