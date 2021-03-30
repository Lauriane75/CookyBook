//
//  SignupViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol SignupViewModelDelegate: class {
    func goToHomeScreen()
}

final class SignupViewModel {

    // MARK: - Properties

    private let authmanager: AuthManagerType
    private let dataBasemanager: DataBaseManagerType
    private weak var delegate: SignupViewModelDelegate?

    // MARK: - Initializer

    init(authmanager: AuthManagerType,
         dataBasemanager: DataBaseManagerType,
         delegate: SignupViewModelDelegate?) {
        self.authmanager = authmanager
        self.dataBasemanager = dataBasemanager
        self.delegate = delegate
    }

    // MARK: - Output

    var signupButtonText: ((String) -> Void)?
    var errorLabelText: ((String) -> Void)?
    var errorLabelAlpha: ((Int) -> Void)?
    var firstNamePlaceHolderText: ((String) -> Void)?
    var lastNamePlaceHolderText: ((String) -> Void)?
    var emailPlaceHolderText: ((String) -> Void)?
    var passwordPlaceHolderText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        signupButtonText?("Signup")
        firstNamePlaceHolderText?("First name")
        lastNamePlaceHolderText?("Last name")
        emailPlaceHolderText?("Email")
        passwordPlaceHolderText?("Password")
    }

    func viewWillAppear() {
    }

    func didPressSignupButton(firstName: String, lastName: String, email: String, password: String) {
        let error = self.validateTheFields(firstName: firstName, lastName: lastName, email: email, password: password)
        guard error == nil else {
            errorLabelText?(error!)
            errorLabelAlpha?(1)
            return
        }
        errorLabelAlpha?(0)
        register(email, password, firstName, lastName)    }

    // MARK: - Private Functions

    private func validateTheFields(firstName: String, lastName: String, email: String, password: String) -> String? {
        guard firstName != "" && lastName != "" && email != "" && password != "" else {
            return "Please fill in all fields"
        }
        guard Utilities.isPasswordValid(password) == true else {
            // Password isn't secure enough
            return "Please make sure your passeword is at least 8 characters and contains a special character and numbers"
        }
        return nil
    }

    fileprivate func register(_ email: String, _ password: String, _ firstName: String, _ lastName: String) {
        authmanager.signup(email: email, password: password) { (result, error) in
            guard error == nil else {
                self.errorLabelText?("Error creating user")
                self.errorLabelAlpha?(1)
                return
            }
            self.errorLabelAlpha?(0)
            self.dataBasemanager.saveUser(firstName: firstName, lastName: lastName, email: email, password: password, result: result) { (Error) in
                guard Error == nil else {
                    self.errorLabelText?("We could't register your account for some reason, please try again")
                    return
                }
            }
            self.delegate?.goToHomeScreen()
        }
    }

}


