//
//  HomeViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {
    func goToMessageScreen()
    func goToLikeScreen()
}

final class HomeViewModel {

    // MARK: - Properties

    private let Authmanager: AuthManagerType

    private weak var delegate: HomeViewModelDelegate?

    // MARK: - Initializer

    init(authmanager: AuthManagerType, delegate: HomeViewModelDelegate?) {
        self.Authmanager = authmanager
        self.delegate = delegate
    }

    // MARK: - Output

    var appNameText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        appNameText?("Cooky Book")
    }

    func viewWillAppear() {
    }

    func didPressMessageButton() {
        delegate?.goToMessageScreen()
    }

    func didPressLikeButton() {
        delegate?.goToLikeScreen()
    }

}

