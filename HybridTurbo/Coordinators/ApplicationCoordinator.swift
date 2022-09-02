//
//  ApplicationCoordinator.swift
//  HybridTurbo
//
//  Created by William Kennedy on 01/09/2022.
//

import UIKit

class ApplicationCoordinator: Coordinator {

    var rootViewController: UIViewController {
        return tabBarController
    }

    private let tabBarController = UITabBarController()

    override init() {
        super.init()

        let numbersCoordinator = NumbersCoordinator()

        let turboCoordinator = TurboCoordinator()

        tabBarController.viewControllers = [
            numbersCoordinator.rootViewController,
            turboCoordinator.rootViewController
        ]

        childCoordinators.append(numbersCoordinator)
        childCoordinators.append(turboCoordinator)

    }

    override func start() {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.start()
        }
    }

}
