//
//  Coordinator.swift
//  Hotel
//
//  Created by Nikita Usov on 05.09.2023.
//

import UIKit

public protocol Coordinator: AnyObject {

    // MARK: - Properties

    var rootViewController: UIViewController { get }

    var children: [Coordinator] { get }

    // MARK: - Methods

    func start()
}
