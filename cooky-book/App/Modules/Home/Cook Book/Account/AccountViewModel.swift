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

    private let repository: AuthRepositoryType

    private weak var delegate: AccountViewModelDelegate?


    // MARK: - Initializer

    init(repository: AuthRepositoryType, delegate: AccountViewModelDelegate?) {
        self.repository = repository
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

