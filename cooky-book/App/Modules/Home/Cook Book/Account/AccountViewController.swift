//
//  AccountViewController.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 05/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var label: UILabel!

    // MARK: - Properties

    var viewModel: AccountViewModel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel!)

        viewModel.viewDidLoad()
    }

    // MARK: - Private Functions

    private func bind(to viewModel: AccountViewModel) {
        viewModel.labelText = { [weak self] text in
            self?.label.text = text
        }
    }

    // MARK: - View actions

    @IBAction func didPressSignoutButton(_ sender: Any) {
        viewModel.didPressSignoutButton()
    }

}
