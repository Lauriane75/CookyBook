//
//  CookBookCollectionViewCell.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 21/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class CookBookCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak var recipeImageView: UIImageView!

    // MARK: - Configure

    func configure() {
        recipeImageView.image = UIImage(named: "recipe-image")
    }
}
