//
//  NumbersCoordinator.swift
//  HybridTurbo
//
//  Created by William Kennedy on 01/09/2022.
//
import UIKit
import Foundation

class NumbersCoordinator :Coordinator {
    func tab() -> UITabBarItem {
        let item = UITabBarItem()
        item.title = "Home"
        item.image = UIImage(systemName: "person.crop.circle")
        return item
    }

    var rootViewController: UIViewController {
        numbersViewController.tabBarItem = tab()
        return numbersViewController
    }

    private let numbersViewController = NumbersViewController()

}
