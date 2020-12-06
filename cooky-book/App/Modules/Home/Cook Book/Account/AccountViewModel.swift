//
//  AccountViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 05/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol AccountViewModelDelegate: class {

}

final class AccountViewModel {

    // MARK: - Properties

    private let repository: AuthManagerType

    private weak var delegate: AccountViewModelDelegate?


    // MARK: - Initializer

    init(Authmanager: AuthManagerType, delegate: AccountViewModelDelegate?) {
        self.repository = Authmanager
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

    // MARK: - Private Functions

}

