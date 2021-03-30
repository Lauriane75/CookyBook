//
//  MessageCoordinator.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class MessageCoordinator {

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

// MARK: - CoordinatorProtocol

extension MessageCoordinator: CoordinatorProtocol {

    func start() {
        showMessageView()
    }

    private func showMessageView() {
        let viewController = screens.createMessageViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }

    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        navigationController.visibleViewController?.present(alert, animated: true, completion: nil)
    }
}

extension MessageCoordinator: MessageViewModelDelegate {

}

