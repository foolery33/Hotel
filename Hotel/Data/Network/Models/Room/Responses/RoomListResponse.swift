//
//  RoomsResponse.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

struct RoomListResponse: Decodable {
    let rooms: [RoomResponse]
}
