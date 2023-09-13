//
//  GetRoomUseCase.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

final class GetRoomUseCase {

    // MARK: - Private Properties

    private let roomRepository: RoomRepository

    // MARK: - Init

    public init(roomRepository: RoomRepository) {
        self.roomRepository = roomRepository
    }

    // MARK: - UseCase

    public func invoke(
        completion: @escaping (
            (Result<RoomListDomain, Error>) -> Void
        )
    ) {
        roomRepository.getRoomList { result in
            switch result {
            case .success(let domain):
                completion(.success(domain))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
