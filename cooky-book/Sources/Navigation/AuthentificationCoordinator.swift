//
//  AuthentificationCoordinator.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class AuthentificationCoordinator {

    // MARK: - Properties

    private var presenter: UIWindow

    private let context: Context

    private var loginCoordinator: LoginCoordinator?

    let tabBarController = UITabBarController()

    private unowned var appDelegate: AppDelegate

    // MARK: - Initializer

    init(presenter: UIWindow, context: Context, appDelegate: AppDelegate) {
        self.presenter = presenter
        self.context = context
        self.appDelegate = appDelegate
    }
}

// MARK: - CoordinatorProtocol

extension AuthentificationCoordinator {

    // MARK: - Start

    func start() {
        presenter.rootViewController = UIViewController()

        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }
        showLogin()
    }

    // MARK: - Create viewControllers

    private func showLogin() {
        loginCoordinator = LoginCoordinator(presenter: presenter, context: context, appDelegate: appDelegate)
        loginCoordinator?.start()
    }
}


