//
//  AddRecipeViewController.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 05/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var label: UILabel!
    
    var viewModel: AddRecipeViewModel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel!)

        viewModel.viewDidLoad()
    }

    // MARK: - Private Functions

    private func bind(to viewModel: AddRecipeViewModel) {
        viewModel.labelText = { [weak self] text in
            self?.label.text = text
        }
    }

    // MARK: - View actions



}
