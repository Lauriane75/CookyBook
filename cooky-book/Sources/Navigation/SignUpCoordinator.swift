//
//  SignUpCoordinator.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class SignUpCoordinator {

    // MARK: - Properties

    private let navigationController: UINavigationController

    private let screens: Screens

    // MARK: - Initializer

    init(presenter: UINavigationController, screens: Screens) {
        self.navigationController = presenter
        self.screens = screens
    }

    private func showHomeView(userItem: UserItem) {
        let viewController = screens.createHomeViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }

}

extension SignUpCoordinator: SignupViewModelDelegate {
    func goToHomeScreen(userItem: UserItem) {
        showHomeView(userItem: userItem)
    }
}

extension SignUpCoordinator: HomeViewModelDelegate {

}
