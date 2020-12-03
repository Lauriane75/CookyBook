//
//  IngredientTableViewCell.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 26/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class IngredientTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var ingredientNameLabel: UILabel!

    // MARK: - Configure
    func configure() {
        let ingredients  = ["eggs"]
        for ingredient in ingredients {
            ingredientNameLabel.text = ingredient
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()

    }
}
