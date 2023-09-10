//
//  NetworkServiceProvider.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

final class NetworkServiceProvider {

    // MARK: - Private Properties

    private lazy var networkClientProvider: NetworkClientProvider = .init()

    // MARK: - Instances

    lazy var hotelService: HotelService = {
        HotelServiceImpl(client: networkClientProvider.hotelClient)
    }()

    lazy var roomService: RoomService = {
        RoomServiceImpl(client: networkClientProvider.roomClient)
    }()

}
