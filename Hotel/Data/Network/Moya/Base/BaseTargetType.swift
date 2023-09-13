//
//  BaseTargetType.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Moya
import Foundation

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    var baseURL: URL { URL(string: "https://run.mocky.io/v3")! }

    var validationType: ValidationType { .successAndRedirectCodes }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "accept": "application/json"
        ]
    }
}
