//
//  RoomService.swift
//  Hotel
//
//  Created by Nikita Usov on 08.09.2023.
//

import Foundation

protocol RoomService {
    func getRoomList(
        completion: @escaping (
            (Result<RoomListResponse, Error>) -> Void
        )
    )
}
