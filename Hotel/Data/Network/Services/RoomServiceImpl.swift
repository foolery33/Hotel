//
//  RoomServiceImpl.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation
import Moya

final class RoomServiceImpl: BaseNetworkService {

    // MARK: - Private Properties

    private let client: MoyaProvider<RoomEndpoint>

    private let jsonDecoder: JSONDecoder = .init()

    // MARK: - Init

    public init(client: MoyaProvider<RoomEndpoint>) {
        self.client = client
    }

}

// MARK: - RoomService

extension RoomServiceImpl: RoomService {
    func getRoomList(
        completion: @escaping (
            (Result<RoomListResponse, Error>) -> Void
        )
    ) {
        client.request(.getRoomList) { [weak self] moyaResult in
            guard let result = self?.handlerResponse(
                result: moyaResult,
                outputModel: RoomListResponse.self
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
