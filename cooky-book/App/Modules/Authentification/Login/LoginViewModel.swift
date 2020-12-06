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
    func goToHomeScreen()
}

final class LoginViewModel {

    // MARK: - Properties

    private let Authmanager: AuthManagerType

    private weak var delegate: LoginViewModelDelegate?


    // MARK: - Initializer

    init(Authmanager: AuthManagerType, delegate: LoginViewModelDelegate?) {
        self.Authmanager = Authmanager
        self.delegate = delegate
    }

    // MARK: - Output

    var loginButtonText: ((String) -> Void)?
    var errorLabelText: ((String) -> Void)?
    var errorLabelAlpha: ((Int) -> Void)?
    var emailTextFieldText: ((String) -> Void)?
    var passwordTextFieldText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        loginButtonText?("Login")
        emailTextFieldText?("Email")
        passwordTextFieldText?("Password")
    }

    func viewWillAppear() {
    }

    // MARK: - Private Functions

    func didPressSignupButton() {
        delegate?.goToSignupScreen()
    }

    func didPressLoginButton(email: String, password: String) {
        let error = self.validateTheFields(email: email, password: password)
        guard error == nil else {
            self.errorLabelText?(error!)
            self.errorLabelAlpha?(1)
            return
        }
        Authmanager.logIn(email: email, password: password) { (result, Error) in
            guard Error == nil else {
                self.errorLabelText?(Error!.localizedDescription)
                self.errorLabelAlpha?(1)
                return
            }
            self.delegate?.goToHomeScreen()
        }
    }

    func setUpVideo() -> URL? {
        let bundlePath = Bundle.main.path(forResource: "loginbackground-1", ofType: "mp4")
        guard bundlePath != nil else { return nil }
        return URL(fileURLWithPath: bundlePath!)
    }


    // MARK: - Private Functions

    func validateTheFields(email: String, password: String) -> String? {
        guard email != "" && password != "" else {
            return "Please fill in all fields"
        }
        return nil
    }
}

