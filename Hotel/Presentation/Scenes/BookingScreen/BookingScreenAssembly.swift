//
//  BookingScreenAssembly.swift
//  Hotel
//
//  Created by Nikita Usov on 10.09.2023.
//

import SwiftUI

enum BookingScreenAssembly {
    static func make(
        with sceneDelegate: BookingScreenSceneDelegate,
        hotelName: String
    ) -> UIHostingController<BookingScreenView> {
        let viewModel = BookingScreenViewModel(
            dependencies: .init(
                getBookingInformationUseCase: UseCaseProvider.instance.getBookingInformationUseCase,
                validatePhoneNumberUseCase: UseCaseProvider.instance.validatePhoneNumberUseCase,
                emailValidationUseCase: UseCaseProvider.instance.emailValidationUseCase
            )
        )
        viewModel.sceneDelegate = sceneDelegate
        viewModel.hotelName = hotelName

        let viewController = UIHostingController(
            rootView: BookingScreenView(
                viewModel: viewModel
            )
        )
        return viewController
    }
}
