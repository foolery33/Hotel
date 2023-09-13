//
//  NetworkClientProvider.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation
import Moya

private class DefaultAlamofireManager: Session {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default

        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.requestCachePolicy = .useProtocolCachePolicy

        return DefaultAlamofireManager(configuration: configuration)
    }()
}

final class NetworkClientProvider {

    // MARK: - Instances

    lazy var hotelClient: MoyaProvider<HotelEndpoint> = {
        makeClient(endpoint: HotelEndpoint.self)
    }()

    lazy var roomClient: MoyaProvider<RoomEndpoint> = {
        makeClient(endpoint: RoomEndpoint.self)
    }()

    lazy var bookingClient: MoyaProvider<BookingEndpoint> = {
        makeClient(endpoint: BookingEndpoint.self)
    }()

    // MARK: - Private Methods

    private func makeClient<T>(endpoint: T.Type) -> MoyaProvider<T> where T: TargetType {
        return .init(
            session: DefaultAlamofireManager.sharedManager
        )
    }
}
