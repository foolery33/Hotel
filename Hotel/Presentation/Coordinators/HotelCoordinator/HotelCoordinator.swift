//
//  HotelCoordinator.swift
//  Hotel
//
//  Created by Nikita Usov on 05.09.2023.
//

import UIKit

final class HotelCoordinator: BaseNavigationCoordinator {

    // MARK: - Start

    override func start() {
        startHotelScreen()
    }

    // MARK: - Private Methods

    private func startHotelScreen() {
        let viewController = HotelScreenAssembly.make(with: self)
        
        navigationController.setViewControllers([viewController], animated: true)
    }

    private func startRoomScreen(hotelName: String) {
        let viewController = RoomScreenAssembly.make(
            with: self,
            hotelName: hotelName
        )

        navigationController.pushViewController(viewController, animated: true)
    }

    private func startBookingScreen(hotelName: String) {
        let viewController = BookingScreenAssembly.make(
            with: self,
            hotelName: hotelName
        )

        navigationController.pushViewController(viewController, animated: true)
    }

    private func startPaymentScreen() {
        let viewController = PaymentScreenAssembly.make(
            with: self
        )

        navigationController.pushViewController(viewController, animated: true)
    }

    private func returnFromScreen() {
        navigationController.popViewController(animated: true)
    }

    private func returnToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}

// MARK: - HotelScreenSceneDelegate

extension HotelCoordinator: HotelScreenSceneDelegate {
    func goToRoomScreen(hotelName: String) {
        startRoomScreen(hotelName: hotelName)
    }
}

// MARK: - RoomScreenSceneDelegate

extension HotelCoordinator: RoomScreenSceneDelegate {
    func goToBookingScreen(hotelName: String) {
        startBookingScreen(hotelName: hotelName)
    }

    func goBackToHotelScreen() {
        returnFromScreen()
    }
}

// MARK: - BookingScreenSceneDelegate

extension HotelCoordinator: BookingScreenSceneDelegate {
    func goToPaymentScreen() {
        startPaymentScreen()
    }

    func goBackToRoomScreen() {
        returnFromScreen()
    }
}

// MARK: - PaymentScreenSceneDelegate

extension HotelCoordinator: PaymentScreenSceneDelegate {
    func goBackToPaymentScreen() {
        returnFromScreen()
    }

    func goBackToRootScreen() {
        returnToRoot()
    }
}
