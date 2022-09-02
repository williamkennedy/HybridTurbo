//
//  SceneDelegate.swift
//  HybridTurbo
//
//  Created by William Kennedy on 11/07/2022.
//

import UIKit
import Turbo


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let coordinator = ApplicationCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        makeAndAssignWindow(in: windowScene)
        coordinator.start()
    }

    private func makeAndAssignWindow(in windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = coordinator.rootViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}


