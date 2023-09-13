//
//  RoomEndpoint.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Moya

enum RoomEndpoint {
    case getRoomList
}

// MARK: - TargetType

extension RoomEndpoint: BaseTargetType {
    var path: String {
        switch self {
        case .getRoomList:
            return "/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
        }
    }

    var method: Method {
        switch self {
        case .getRoomList:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getRoomList:
            return .requestPlain
        }
    }
}
