//
//  HotelScreenAssembly.swift
//  Hotel
//
//  Created by Nikita Usov on 05.09.2023.
//

import SwiftUI

enum HotelScreenAssembly {
    static func make(
        with sceneDelegate: HotelScreenSceneDelegate
    ) -> UIHostingController<HotelScreenView> {
        let viewModel = HotelScreenViewModel(
            dependencies: .init(
                getHotelUseCase: UseCaseProvider.instance.getHotelUseCase
            )
        )
        viewModel.sceneDelegate = sceneDelegate

        let viewController = UIHostingController(
            rootView: HotelScreenView(
                viewModel: viewModel
            )
        )
        return viewController
    }
}
