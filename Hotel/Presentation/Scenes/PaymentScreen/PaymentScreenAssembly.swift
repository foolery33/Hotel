//
//  PaymentScreenAssembly.swift
//  Hotel
//
//  Created by Nikita Usov on 13.09.2023.
//

import SwiftUI

enum PaymentScreenAssembly {
    static func make(
        with sceneDelegate: PaymentScreenSceneDelegate
    ) -> UIHostingController<PaymentScreenView> {
        let viewModel = PaymentScreenViewModel()
        viewModel.sceneDelegate = sceneDelegate

        let viewController = UIHostingController(
            rootView: PaymentScreenView(
                viewModel: viewModel
            )
        )
        return viewController
    }
}
