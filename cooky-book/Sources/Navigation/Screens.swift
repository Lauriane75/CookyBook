//
//  Screens.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class Screens {

    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))

    private let context: Context

    init(context: Context) {
        self.context = context
    }
}

// MARK: - Authentification

// MARK: - Login

extension Screens {
    func createLoginViewController(delegate: LoginViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "LoginViewController") as! LoginViewController
        let repository = AuthRepository(context: context)
        let viewModel = LoginViewModel(repository: repository,
                                       delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Signup

extension Screens {
    func createSignupViewController(delegate: SignupViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "SignupViewController") as! SignupViewController
        let repository = AuthRepository(context: context)
        let viewModel = SignupViewModel(repository: repository,
                                        delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Home

extension Screens {
    func createHomeViewController(delegate: HomeViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "HomeViewController") as! HomeViewController
        let repository = AuthRepository(context: context)
        let viewModel = HomeViewModel(repository: repository,
                                      delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Message

extension Screens {
    func createMessageViewController(delegate: MessageViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "MessageViewController") as! MessageViewController
        let repository = AuthRepository(context: context)
        let viewModel = MessageViewModel(repository: repository,
                                         delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Like

extension Screens {
    func createLikesViewController(delegate: LikesViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "LikesViewController") as! LikesViewController
        let repository = AuthRepository(context: context)
        let viewModel = LikesViewModel(repository: repository,
                                      delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - CookBook

extension Screens {
    func createCookBookViewController(delegate: CookBookViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "CookBookViewController") as! CookBookViewController
        let repository = CookBookRepository(context: context)
        let viewModel = CookBookViewModel(repository: repository,
                                          delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Recipe detail

extension Screens {
    func createRecipeDetailViewController(delegate: RecipeDetailViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "RecipeDetailViewController") as! RecipeDetailViewController
        let repository = CookBookRepository(context: context)
        let viewModel = RecipeDetailViewModel(repository: repository,
                                              delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Alert

extension Screens {
    func createAlertView(for type: AlertType) -> UIAlertController {
        let alert = Alert(type: type)
        let alertViewController = UIAlertController(title: alert.title,
                                                    message: alert.message,
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        return alertViewController
    }
}

