//
//  LikeViewController.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 04/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var label: UILabel!
    
    // MARK: - Properties

    var viewModel: LikesViewModel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    // MARK: - Private Functions

    private func bind(to viewModel: LikesViewModel) {
        viewModel.labelText = { [weak self] text in
            self?.label.text = text
        }
    }


    // MARK: - View actions

}
