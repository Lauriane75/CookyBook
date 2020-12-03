//
//  HomeViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {

}

final class HomeViewModel {

    // MARK: - Properties

    private let repository: AuthRepositoryType

    private weak var delegate: HomeViewModelDelegate?

//    private var userItem: UserItem

    // MARK: - Initializer

    init(repository: AuthRepositoryType, delegate: HomeViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
//        self.userItem = userItem
    }

    // MARK: - Output

    var appNameText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        appNameText?("Cooky Book")
    }

    func viewWillAppear() {
    }

}

