//
//  MessageViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol MessageViewModelDelegate: class {

}

final class MessageViewModel {

    // MARK: - Properties

    private let Authmanager: AuthManagerType

    private weak var delegate: MessageViewModelDelegate?


    // MARK: - Initializer

    init(Authmanager: AuthManagerType, delegate: MessageViewModelDelegate?) {
        self.Authmanager = Authmanager
        self.delegate = delegate
    }

    // MARK: - Output

    var labelText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        labelText?("Message screen")
    }

    func viewWillAppear() {
    }

    // MARK: - Private Functions

}

