//
//  LikeViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 04/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol LikesViewModelDelegate: class {

}

final class LikesViewModel {

    // MARK: - Properties

    private let Authmanager: AuthManagerType

    private weak var delegate: LikesViewModelDelegate?


    // MARK: - Initializer

    init(Authmanager: AuthManagerType, delegate: LikesViewModelDelegate?) {
        self.Authmanager = Authmanager
        self.delegate = delegate
    }

    // MARK: - Output

    var labelText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        labelText?("likes screen")
    }

    func viewWillAppear() {
    }

    // MARK: - Private Functions

}

