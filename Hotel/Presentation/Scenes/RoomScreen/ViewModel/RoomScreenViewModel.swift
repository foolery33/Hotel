//
//  RoomScreenViewModel.swift
//  Hotel
//
//  Created by Nikita Usov on 08.09.2023.
//

import SwiftUI

final class RoomScreenViewModel: ObservableObject {

    // MARK: - Public Properties

    public weak var sceneDelegate: RoomScreenSceneDelegate?

    @Published public var hotelName: String = .init()
    @Published public var roomList: [RoomDomain] = .init()
    @Published public var error: String = ""
    @Published public var isLoading: Bool = false

    // MARK: - Private Properties

    private let dependencies: Dependencies

    // MARK: - Init

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // Public Methods

    public func viewDidAppear() {
        getRoom()
    }

    public func goToBookingScreen() {
        sceneDelegate?.goToBookingScreen(hotelName: hotelName)
    }

    public func goBackToHotelScreen() {
        sceneDelegate?.goBackToHotelScreen()
    }

    // MARK: - Private Methods

    private func getRoom() {
        isLoading = true
        dependencies.getRoomUseCase.invoke { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let domain):
                self?.roomList = domain.rooms

            case .failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }

}

// MARK: - Nested Types

extension RoomScreenViewModel {
    struct Dependencies {
        let getRoomUseCase: GetRoomUseCase
    }
}
