//
//  MessageViewController.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 03/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var label: UILabel!
    
    // MARK: - Properties

    var viewModel: MessageViewModel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel!)

        viewModel.viewDidLoad()
    }

    // MARK: - Private Functions

    private func bind(to viewModel: MessageViewModel) {
        viewModel.labelText = { [weak self] text in
            self?.label.text = text
        }
    }

    // MARK: - View actions

}

