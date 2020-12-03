//
//  LoginViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate: class {
    func goToSignupScreen()
    func goToHomeScreen(userItem: UserItem)
}

final class LoginViewModel {

    // MARK: - Properties

    private let repository: AuthRepositoryType

    private weak var delegate: LoginViewModelDelegate?


    // MARK: - Initializer

    init(repository: AuthRepositoryType, delegate: LoginViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Output

    var loginButtonText: ((String) -> Void)?
    var errorLabelText: ((String) -> Void)?
    var errorLabelAlpha: ((Int) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        loginButtonText?("Login")
    }

    func viewWillAppear() {
    }

    // MARK: - Private Functions

    func didPressSignupButton() {
        delegate?.goToSignupScreen()
    }

    func didPressLoginButton(email: String, password: String) {
        let userItem = UserItem(uid: "1", firstName: "test", lastName: "test", password: "test")
        self.delegate?.goToHomeScreen(userItem: userItem)
    }
}

