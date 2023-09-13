//
//  Mapper.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

protocol Mapper {
    associatedtype Domain
    associatedtype Response

    func call(_ response: Response) -> Domain
}
