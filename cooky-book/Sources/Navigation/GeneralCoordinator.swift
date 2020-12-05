//
//  GeneralCoordinator.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class GeneralCoordinator {

    // MARK: - Properties

    private unowned var appDelegate: AppDelegate

    private var tabBarCoordinator: TabBarCoordinator

    // MARK: - Initializer

    init(appDelegate: AppDelegate, tabBarCoordinator: TabBarCoordinator) {
        self.appDelegate = appDelegate
        self.tabBarCoordinator = tabBarCoordinator
    }
}

// MARK: - CoordinatorProtocol

extension GeneralCoordinator {

    // MARK: - Start

    func start() {
        let tabBarController = tabBarCoordinator.tabBarController

        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window!.rootViewController = tabBarController
        appDelegate.window!.makeKeyAndVisible()
        tabBarController.viewControllers = []

        // to stop running while testing
        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }
        tabBarCoordinator.createTabBar(tabBarController)
    }
}
