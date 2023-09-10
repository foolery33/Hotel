//
//  BookingScreenAssembly.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import SwiftUI

enum BookingScreenAssembly {
    static func make(
        with sceneDelegate: BookingScreenSceneDelegate
    ) -> UIHostingController<BookingScreenView> {
        let viewModel = BookingScreenViewModel(
            dependencies: .init()
        )
        viewModel.sceneDelegate = sceneDelegate

        let viewController = UIHostingController(
            rootView: BookingScreenView(
                viewModel: viewModel
            )
        )
        return viewController
    }
}
