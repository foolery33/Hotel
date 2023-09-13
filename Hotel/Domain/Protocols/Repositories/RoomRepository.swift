//
//  RoomRepository.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

protocol RoomRepository {
    func getRoomList(
        completion: @escaping (
            (Result<RoomListDomain, Error>) -> Void
        )
    )
}
