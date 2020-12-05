//
//  LoginCoordinator.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class LoginCoordinator {

    // MARK: - Properties

    private let presenter: UIWindow

    private let navigationController: UINavigationController

    private let screens: Screens

    var coordinator: GeneralCoordinator?

    private unowned var appDelegate: AppDelegate


    // MARK: - Initializer

    init(presenter: UIWindow, context: Context, appDelegate: AppDelegate) {
        self.presenter = presenter
        self.screens = Screens(context: context)
        self.navigationController = UINavigationController()
        self.appDelegate = appDelegate
    }

    // MARK: - Coordinator

    func start() {
        presenter.rootViewController = navigationController
        showLoginScreen()
    }

    private func showLoginScreen() {
        let viewController = screens.createLoginViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }

    private func showSignupView() {
        let viewController = screens.createSignupViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }

    private func showHomeView() {
        let tabBarCoordinator = TabBarCoordinator(screens: screens)
        coordinator = GeneralCoordinator(appDelegate: appDelegate, tabBarCoordinator: tabBarCoordinator)
        coordinator?.start()
    }

}

extension LoginCoordinator: LoginViewModelDelegate {
    
    func goToHomeScreen() {
        showHomeView()
    }

    func goToSignupScreen() {
        showSignupView()
    }
}

extension LoginCoordinator: SignupViewModelDelegate {

}


