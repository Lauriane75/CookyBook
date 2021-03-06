//
//  AddRecipeViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 05/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol AddRecipeViewModelDelegate: class {

}

final class AddRecipeViewModel {

    // MARK: - Properties

    private let repository: AuthManagerType

    private weak var delegate: AddRecipeViewModelDelegate?


    // MARK: - Initializer

    init(authmanager: AuthManagerType, delegate: AddRecipeViewModelDelegate?) {
        self.repository = authmanager
        self.delegate = delegate
    }

    // MARK: - Output

    var labelText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        labelText?("Add recipe Screen")
    }

    func viewWillAppear() {
    }

    // MARK: - Private Functions

}

