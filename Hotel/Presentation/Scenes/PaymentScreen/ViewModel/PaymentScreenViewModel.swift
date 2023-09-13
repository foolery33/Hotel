//
//  PaymentScreenViewModel.swift
//  Hotel
//
//  Created by Nikita Usov on 13.09.2023.
//

import Foundation

final class PaymentScreenViewModel: ObservableObject {

    // MARK: - Public Properties

    public weak var sceneDelegate: PaymentScreenSceneDelegate?

    // MARK: - Public Methods

    public func goBackToPaymentScreen() {
        sceneDelegate?.goBackToPaymentScreen()
    }

    public func goBackToHotelScreen() {
        sceneDelegate?.goBackToRootScreen()
    }

}
