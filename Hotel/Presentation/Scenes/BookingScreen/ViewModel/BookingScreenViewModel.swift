//
//  BookingScreenViewModel.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import Foundation

final class BookingScreenViewModel: ObservableObject {

    // MARK: - Public Properties

    public weak var sceneDelegate: BookingScreenSceneDelegate?

    // MARK: - Private Properties

    private let dependencies: Dependencies

    // MARK: - Init

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

}

// MARK: - Nested Types

extension BookingScreenViewModel {
    struct Dependencies {

    }
}
