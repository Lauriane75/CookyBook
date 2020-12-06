//
//  SignupViewController.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!

    // MARK: - Properties

    var viewModel: SignupViewModel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()

        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    // MARK: - Private Functions


    private func bind(to viewModel: SignupViewModel) {
        viewModel.signupButtonText = { [weak self] text in
            guard let self = self else { return }
            self.signupButton.setTitle(text, for: .normal)
        }
        viewModel.errorLabelText = { [weak self] text in
            guard let self = self else { return }
            self.errorLabel.text = text
        }
        viewModel.errorLabelAlpha = { [weak self] alpha in
            guard let self = self else { return }
            self.errorLabel.alpha = CGFloat(alpha)
        }
    }

    // MARK: - View actions

    @IBAction func didPressSignupButton(_ sender: Any) {
        let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        viewModel.didPressSignupButton(firstName: firstName, lastName: lastName, email: email, password: password)
    }

    // MARK: - Private Files

    private func setUpElements() {
        errorLabel.alpha = 0
        viewModel.firstNamePlaceHolderText = { [weak self] text in
            guard let self = self else { return }
            Custom.styleTextField(self.firstNameTextField, bottomLineColor: UIColor.white.cgColor, placeHolderText: text, placeHolderColor: .gray)
        }
        viewModel.lastNamePlaceHolderText = { [weak self] text in
            guard let self = self else { return }
            Custom.styleTextField(self.lastNameTextField, bottomLineColor: UIColor.white.cgColor, placeHolderText: text, placeHolderColor: .gray)
        }
        viewModel.emailPlaceHolderText = { [weak self] text in
            guard let self = self else { return }
            Custom.styleTextField(self.emailTextField, bottomLineColor: UIColor.white.cgColor, placeHolderText: text, placeHolderColor: .gray)
        }
        viewModel.passwordPlaceHolderText = { [weak self] text in
            guard let self = self else { return }
            Custom.styleTextField(self.passwordTextField, bottomLineColor: UIColor.white.cgColor, placeHolderText: text, placeHolderColor: .gray)
        }
        Custom.styleButton(signupButton, backgroundColor: UIColor.orange, tintColor: UIColor.white)
    }
}
