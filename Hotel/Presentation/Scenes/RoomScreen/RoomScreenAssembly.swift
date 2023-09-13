//
//  RoomScreenAssembly.swift
//  Hotel
//
//  Created by Nikita Usov on 08.09.2023.
//

import SwiftUI

enum RoomScreenAssembly {
    static func make(
        with sceneDelegate: RoomScreenSceneDelegate,
        hotelName: String
    ) -> UIHostingController<RoomScreenView> {
        let viewModel = RoomScreenViewModel(
            dependencies: .init(
                getRoomUseCase: UseCaseProvider.instance.getRoomUseCase
            )
        )
        viewModel.sceneDelegate = sceneDelegate
        viewModel.hotelName = hotelName

        let viewController = UIHostingController(
            rootView: RoomScreenView(
                viewModel: viewModel
            )
        )
        return viewController
    }
}
