//
//  AccountViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 05/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol AccountViewModelDelegate: class {
    func goToLoginScreen()
}

final class AccountViewModel {

    // MARK: - Properties

    private let authmanager: AuthManagerType

    private weak var delegate: AccountViewModelDelegate?


    // MARK: - Initializer

    init(authmanager: AuthManagerType, delegate: AccountViewModelDelegate?) {
        self.authmanager = authmanager
        self.delegate = delegate
    }

    // MARK: - Output

    var labelText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        labelText?("Account screen")
    }

    func viewWillAppear() {
    }

    func didPressSignoutButton() {
        authmanager.signOut(completion: {
            print("signout")
            self.delegate?.goToLoginScreen()
        }) { (error) in
            print("error")
        }
    }

    // MARK: - Private Functions

}

