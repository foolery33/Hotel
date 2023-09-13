//
//  AppCoordinator.swift
//  Hotel
//
//  Created by Nikita Usov on 05.09.2023.
//

import UIKit

final class AppCoordinator: BaseNavigationCoordinator {

    // MARK: - Start

    override func start() {
        startAuthFlow()
    }

    // MARK: - Private Methods

    private func startAuthFlow() {
        let coordinator = HotelCoordinator(navigationController: navigationController)

        add(child: coordinator)
        coordinator.start()
    }

}
