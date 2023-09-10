//
//  HotelEndpoint.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Moya

enum HotelEndpoint {
    case getHotel
}

// MARK: - TargetType

extension HotelEndpoint: BaseTargetType {
    var path: String {
        switch self {
        case .getHotel:
            return "/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
        }
    }

    var method: Method {
        switch self {
        case .getHotel:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getHotel:
            return .requestPlain
        }
    }
}
