//
//  CookBookViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol CookBookViewModelDelegate: class {
    func didSelectRecipe()

}

final class CookBookViewModel {

    // MARK: - Properties

    private let repository: CookBookRepositoryType

    private weak var delegate: CookBookViewModelDelegate?

    // MARK: - Initializer

    init(repository: CookBookRepositoryType, delegate: CookBookViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Output

    var nameUserText: ((String) -> Void)?
    var addRecipeButtonImageText: ((String) -> Void)?
    var accountMenuButtonImageText: ((String) -> Void)?
    var profilDescriptiontextViewText: ((String) -> Void)?

    var profileImageViewText: ((String) -> Void)?
    var numberOfRecipeLabelText: ((String) -> Void)?
    var recipeLabelText: ((String) -> Void)?
    var numberOfFriendsLabelText: ((String) -> Void)?
    var friendsLabelText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        self.profilDescriptiontextViewText?("""
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
""")
        self.nameUserText?("Natacha Hope")
        self.addRecipeButtonImageText?("plus")
        self.accountMenuButtonImageText?("person.fill")

        self.profileImageViewText?("profil-pic")
        self.numberOfRecipeLabelText?("3")
        self.recipeLabelText?("Recipes")
        self.numberOfFriendsLabelText?("40")
        self.friendsLabelText?("Friends")
    }

    func viewWillAppear() {
    }

    func didSelectRecipe(at index: Int) {
        print("open recipe view number \(index)")
        self.delegate?.didSelectRecipe()
    }

}

