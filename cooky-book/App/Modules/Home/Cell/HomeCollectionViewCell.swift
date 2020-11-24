//
//  HomeCollectionViewCell.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak var nameRecipeLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var imageRecipeImageView: UIImageView!
    @IBOutlet weak var likeRecipeButton: UIButton!
    @IBOutlet weak var numberOfLikeLabel: UILabel!

    // MARK: - Configure

    func configure() {
        nameUserLabel.text = "Charles Henri"
        nameRecipeLabel.text = "Cake"
        imageRecipeImageView.image = UIImage(named: "cake")
        numberOfLikeLabel.text = "135 likes"
    }
}
