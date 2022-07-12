//
//  AppCoordinator.swift
//  HybridTurbo
//
//  Created by William Kennedy on 12/07/2022.
//
import SafariServices
import Turbo
import UIKit
import WebKit

class AppCoordinator {
    var rootViewController: UIViewController { navigationController }

    func start() {
        visit(url: URL(string: "https://turbo-native-demo.glitch.me")!)
    }

    // MARK: Private
    private let navigationController = UINavigationController()
    private lazy var modalSession = createSession()
    private lazy var session = createSession()


    private func createSession() -> Session {
        let session = Session()
        session.delegate = self
        session.pathConfiguration = PathConfiguration(sources: [
            .file(Bundle.main.url(forResource: "PathConfiguration", withExtension: "json")!),
        ])
        return session
    }

    private func visit(url: URL, action: VisitAction = .advance, properties: PathProperties = [:]) {
        let viewController = VisitableViewController(url: url)

        if properties["presentation"] as? String == "modal" {
            navigationController.present(viewController, animated: true)
        } else if action == .advance {
            navigationController.pushViewController(viewController, animated: true)
        } else {
            navigationController.viewControllers = Array(navigationController.viewControllers.dropLast()) + [viewController]
        }

        if properties["presentation"] as? String == "modal" {
            modalSession.visit(viewController)
        } else {
            session.visit(viewController)
        }
    }
}

extension AppCoordinator: SessionDelegate {
    func session(_ session: Session, didProposeVisit proposal: VisitProposal) {
        visit(url: proposal.url, action: proposal.options.action, properties: proposal.properties)
    }

    func sessionWebViewProcessDidTerminate(_ session: Session) {
        return
    }

    func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, error: Error) {
        print("didFailRequestForVisitable: \(error)")
    }
}

