//
//  RepositoryProvider.swift
//  Hotel
//
//  Created by Nikita Usov on 06.09.2023.
//

import Foundation

final class RepositoryProvider {

    // MARK: - Private Properties

    private let networkServiceProvider: NetworkServiceProvider

    // MARK: - Init

    public init(networkServiceProvider: NetworkServiceProvider) {
        self.networkServiceProvider = networkServiceProvider
    }

    // MARK: - Instances

    lazy var hotelRepository: HotelRepository = {
        HotelRepositoryImpl(
            hotelService: networkServiceProvider.hotelService,
            hotelMapper: .init()
        )
    }()

    lazy var roomRepository: RoomRepository = {
        RoomRepositoryImpl(
            roomService: networkServiceProvider.roomService,
            roomListMapper: .init()
        )
    }()

}
