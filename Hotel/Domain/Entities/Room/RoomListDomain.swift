//
//  RoomListDomain.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

struct RoomListDomain {
    let rooms: [RoomDomain]

    init(rooms: [RoomDomain]) {
        self.rooms = rooms
    }

    init() {
        self.rooms = .init()
    }
}
