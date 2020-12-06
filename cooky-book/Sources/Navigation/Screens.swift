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
        let Authmanager = AuthManager(context: context)
        let viewModel = LoginViewModel(Authmanager: Authmanager,
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
        let Authmanager = AuthManager(context: context)
        let viewModel = SignupViewModel(Authmanager: Authmanager,
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
        let Authmanager = AuthManager(context: context)
        let viewModel = HomeViewModel(Authmanager: Authmanager,
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
        let Authmanager = AuthManager(context: context)
        let viewModel = MessageViewModel(Authmanager: Authmanager,
                                         delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Likes

extension Screens {
    func createLikesViewController(delegate: LikesViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "LikesViewController") as! LikesViewController
        let Authmanager = AuthManager(context: context)
        let viewModel = LikesViewModel(Authmanager: Authmanager,
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
        let Authmanager = CookBookRepository(context: context)
        let viewModel = CookBookViewModel(Authmanager: Authmanager,
                                          delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Account

extension Screens {
    func createAccountViewController(delegate: AccountViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "AccountViewController") as! AccountViewController
        let Authmanager = AuthManager(context: context)
        let viewModel = AccountViewModel(Authmanager: Authmanager,
                                         delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Add Recipe

extension Screens {
    func createAddRecipeViewController(delegate: AddRecipeViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "AddRecipeViewController") as! AddRecipeViewController
        let Authmanager = AuthManager(context: context)
        let viewModel = AddRecipeViewModel(Authmanager: Authmanager,
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
        let Authmanager = CookBookRepository(context: context)
        let viewModel = RecipeDetailViewModel(Authmanager: Authmanager,
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

