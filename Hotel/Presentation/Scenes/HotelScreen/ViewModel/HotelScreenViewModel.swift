//
//  HotelScreenViewModel.swift
//  Hotel
//
//  Created by Nikita Usov on 05.09.2023.
//

import SwiftUI

final class HotelScreenViewModel: ObservableObject {

    // MARK: - Public Properties

    public weak var sceneDelegate: HotelScreenSceneDelegate?

    @Published public var hotel: HotelDomain = .init()
    @Published public var error: String = ""
    @Published public var isLoading: Bool = false

    // MARK: - Private Properties

    private let dependencies: Dependencies

    // MARK: - Init

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Public Methods

    public func viewDidAppear() {
        getHotel()
    }

    public func goToRoomScreen() {
        sceneDelegate?.goToRoomScreen(hotelName: hotel.name)
    }

    // MARK: - Private Methods

    private func getHotel() {
        isLoading = true
        dependencies.getHotelUseCase.invoke { [weak self] result in
            self?.isLoading = false

            switch result {
            case .success(let domain):
                self?.hotel = domain

            case .failure(let error):
                self?.error = error.localizedDescription
            }
        }
    }

}

// MARK: - Nested Types

extension HotelScreenViewModel {
    struct Dependencies {
        let getHotelUseCase: GetHotelUseCase
    }
}
