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

    // MARK: - Alert

    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        navigationController.visibleViewController?.present(alert, animated: true, completion: nil)
    }
}

extension HomeCoordinator: HomeViewModelDelegate {

}
