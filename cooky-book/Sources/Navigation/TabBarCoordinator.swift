//
//  TabBarCoordinator.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class TabBarCoordinator {

    // MARK: - Properties

    private var screens: Screens

    let tabBarController = UITabBarController()

    var coordinators: [CoordinatorProtocol] = []

    // MARK: - Initializer

    init(screens: Screens) {
        self.screens = screens
    }
}

// MARK: - Creating tabs

extension TabBarCoordinator {

    func createTabBar(_ tabBarController: UITabBarController) {
        let homeItem = createNavigationController(withTitle: "Home", image: UIImage(systemName: "house")!)
        let cookBookItem = createNavigationController(withTitle: "CookBook", image: UIImage(systemName: "book")!)

        let homeCoordinator = HomeCoordinator(presenter: homeItem, screens: screens)
        coordinators.append(homeCoordinator)
        homeCoordinator.start()

        let cookBook = CookBookCoordinator(presenter: cookBookItem, screens: screens)
        coordinators.append(cookBook)
        cookBook.start()

        let rootViewControllers = [homeItem, cookBookItem]
        tabBarController.setViewControllers(rootViewControllers, animated: false)
    }

    func createNavigationController(withTitle title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navController.navigationBar.shadowImage = UIImage()
        navController.navigationBar.tintColor = UIColor.white

        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = UIColor(named: "black")

        navController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)

        return navController
    }
}
