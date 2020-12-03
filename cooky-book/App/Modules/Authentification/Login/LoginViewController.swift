//
//  LoginViewController.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    // MARK: - Properties
    
    var viewModel: LoginViewModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel!)
        
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: LoginViewModel) {
        viewModel.loginButtonText = { [weak self] text in
            guard let self = self else { return }
            self.loginButton.setTitle(text, for: .normal)
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
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        viewModel.didPressLoginButton(email: email, password: password)
    }
    
    @IBAction func didPressSignupButton(_ sender: Any) {
        viewModel.didPressSignupButton()
    }

    // MARK: - Private Files

    fileprivate func setUpElements() {
        errorLabel.alpha = 0
        Custom.styleTextField(emailTextField, backgroundColor: UIColor.blue.cgColor)
        Custom.styleTextField(emailTextField, backgroundColor: UIColor.blue.cgColor)
        Custom.styleButton(signupButton, backgroundColor: UIColor.blue, tintColor: UIColor.white)
        Custom.styleButton(loginButton, backgroundColor: UIColor.green, tintColor: UIColor.white)
    }
    
}
