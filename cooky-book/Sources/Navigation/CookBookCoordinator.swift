//
//  CookBookCoordinator.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class CookBookCoordinator {

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

extension CookBookCoordinator: CoordinatorProtocol {

    func start() {
        showCookBookView()
    }

    private func showCookBookView() {
        let viewController = screens.createCookBookViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: false)
    }

    private func showAlert(for type: AlertType) {
        let alert = screens.createAlertView(for: type)
        navigationController.visibleViewController?.present(alert, animated: true, completion: nil)
    }

    private func showRecipeDetailView() {
        let viewController = screens.createRecipeDetailViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: true)
    }

    private func showAddRecipeView() {
        let viewController = screens.createAddRecipeViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: true)
    }

    private func showAccountView() {
        let viewController = screens.createAccountViewController(delegate: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension CookBookCoordinator: CookBookViewModelDelegate {
    func goToAccountScreen() {
        showAccountView()
    }

    func goToAddRecipeScreen() {
        showAddRecipeView()
    }

    func didSelectRecipe() {
        showRecipeDetailView()
    }
}

extension CookBookCoordinator: RecipeDetailViewModelDelegate {
    func displayAlert(for type: AlertType) {
        showAlert(for: .errorService)
    }
}

extension CookBookCoordinator: AccountViewModelDelegate {
}

extension CookBookCoordinator: AddRecipeViewModelDelegate {
}
