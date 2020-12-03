//
//  SignupViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol SignupViewModelDelegate: class {
    func goToHomeScreen(userItem: UserItem)
}

final class SignupViewModel {

    // MARK: - Properties

    private let repository: AuthRepositoryType

    private weak var delegate: SignupViewModelDelegate?


    // MARK: - Initializer

    init(repository: AuthRepositoryType, delegate: SignupViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Output

    var signupButtonText: ((String) -> Void)?
    var errorLabelText: ((String) -> Void)?
    var errorLabelAlpha: ((Int) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        signupButtonText?("Signup")
    }

    func viewWillAppear() {
    }

    func didPressSignupButton(firstName: String, lastName: String, email: String, password: String) {
        let userItem = UserItem(uid: "XXX", firstName: "test", lastName: "test", password: "test")
        self.delegate?.goToHomeScreen(userItem: userItem)
    }

    // MARK: - Private Functions

}


