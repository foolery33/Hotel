//
//  RoomListMapper.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

struct RoomListMapper: Mapper {
    typealias Response = RoomListResponse
    typealias Domain = RoomListDomain

    func call(_ response: Response) -> Domain {
        .init(
            rooms: response.rooms.map {
                RoomMapper().call($0)
            }
        )
    }
}
