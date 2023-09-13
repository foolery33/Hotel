//
//  RoomRepositoryImpl.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

final class RoomRepositoryImpl {

    // MARK: - Private Properties

    private let roomService: RoomService

    private let roomListMapper: RoomListMapper

    // MARK: - Init

    public init(
        roomService: RoomService,
        roomListMapper: RoomListMapper
    ) {
        self.roomService = roomService
        self.roomListMapper = roomListMapper
    }

}

// MARK: - HotelRepository

extension RoomRepositoryImpl: RoomRepository {
    func getRoomList(
        completion: @escaping (
            (Result<RoomListDomain, Error>) -> Void
        )
    ) {
        roomService.getRoomList { [weak self] result in
            switch result {
            case .success(let response):
                completion(
                    .success(
                        self?.roomListMapper.call(response) ?? .init()
                    )
                )

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
