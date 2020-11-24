//
//  CookBookViewController.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class CookBookViewController: UIViewController {

    // MARK: - Outlet

    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var addRecipeButton: UIButton!
    @IBOutlet weak var accountMenuButton: UIButton!
    @IBOutlet weak var profilDescriptiontextView: UITextView!

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var numberOfRecipeLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var numberOfFriendsLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!
    

    // MARK: - Properties

    var viewModel: CookBookViewModel!

    private lazy var collectionDataSource = CookBookCollectionDataSource()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = collectionDataSource
        collectionView.delegate = collectionDataSource

        let widthView = view.frame.width
        let heightView = view.frame.height

        self.collectionDataSource.update(width: widthView, height: heightView)
        self.collectionView.reloadData()

        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }

    // MARK: - Private Functions

    private func bind(to viewModel: CookBookViewModel) {
        viewModel.profilDescriptiontextViewText = { [weak self] text in
            guard let self = self else { return }
            self.profilDescriptiontextView.text = text
        }
        viewModel.nameUserText = { [weak self] text in
            guard let self = self else { return }
            self.nameUserLabel.text = text
        }
        viewModel.accountMenuButtonImageText = { [weak self] text in
            guard let self = self else { return }
            self.accountMenuButton.setImage(UIImage(systemName: text), for: .normal)
        }
        viewModel.addRecipeButtonImageText = { [weak self] text in
            guard let self = self else { return }
            self.addRecipeButton.setImage(UIImage(systemName: text), for: .normal)
        }
        viewModel.profileImageViewText = { [weak self] text in
            guard let self = self else { return }
            self.profileImageView.image = UIImage(named: text)
        }
        viewModel.numberOfRecipeLabelText = { [weak self] text in
            guard let self = self else { return }
            self.numberOfRecipeLabel.text = text
        }
        viewModel.recipeLabelText = { [weak self] text in
            guard let self = self else { return }
            self.recipeLabel.text = text
        }
        viewModel.numberOfFriendsLabelText = { [weak self] text in
            guard let self = self else { return }
            self.numberOfFriendsLabel.text = text
        }
        viewModel.friendsLabelText = { [weak self] text in
            guard let self = self else { return }
            self.friendsLabel.text = text
        }
    }

    private func bind(to source: CookBookCollectionDataSource) {
        source.selectedRecipe = viewModel.didSelectRecipe
    }

    // MARK: - View actions

    // MARK: - Private Files

}
