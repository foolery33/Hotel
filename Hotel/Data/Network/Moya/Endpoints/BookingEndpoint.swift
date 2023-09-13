//
//  BookingEndpoint.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Moya

enum BookingEndpoint {
    case getBookingInformation
}

// MARK: - TargetType

extension BookingEndpoint: BaseTargetType {
    var path: String {
        switch self {
        case .getBookingInformation:
            return "/e8868481-743f-4eb2-a0d7-2bc4012275c8"
        }
    }

    var method: Method {
        switch self {
        case .getBookingInformation:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getBookingInformation:
            return .requestPlain
        }
    }
}
