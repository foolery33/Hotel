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

    private func startRoomScreen() {
        let viewController = RoomScreenAssembly.make(with: self)

        navigationController.pushViewController(viewController, animated: true)
    }

    private func startBookingScreen() {
        let viewController = BookingScreenAssembly.make(with: self)

        navigationController.pushViewController(viewController, animated: true)
    }

    private func startPaymentScreen() {

    }

    private func returnFromScreen() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - HotelScreenSceneDelegate

extension HotelCoordinator: HotelScreenSceneDelegate {
    func goToRoomScreen() {
        startRoomScreen()
    }
}

// MARK: - RoomScreenSceneDelegate

extension HotelCoordinator: RoomScreenSceneDelegate {
    func goToBookingScreen() {
        startBookingScreen()
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
