//
//  HomeCoordinator.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class HomeCoordinator {

    // MARK: - Properties

    private let navigationController: UINavigationController

    var childCoordinator: CoordinatorProtocol?

    private let screens: Screens

    // MARK: - Initializer

    init(presenter: UINavigationController, screens: Screens) {
        self.navigationController = presenter
        self.screens = screens
    }
}

extension HomeCoordinator: CoordinatorProtocol {

    // MARK: - Coodinator

    func start() {
        showHomeView()
    }

    // MARK: - Create viewControllers

    private func showHomeView() {
        let viewController = screens.createHomeViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }

    private func showMessageView() {
        let viewController = screens.createMessageViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: true)
    }

    private func showLikesView() {
        let viewController = screens.createLikesViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: true)
    }

    // MARK: - Alert

    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        navigationController.visibleViewController?.present(alert, animated: true, completion: nil)
    }
}

extension HomeCoordinator: HomeViewModelDelegate {
    func goToMessageScreen() {
        showMessageView()
    }

    func goToLikeScreen() {
        showLikesView()
    }
}

extension HomeCoordinator: MessageViewModelDelegate {

}

extension HomeCoordinator: LikesViewModelDelegate {

}
