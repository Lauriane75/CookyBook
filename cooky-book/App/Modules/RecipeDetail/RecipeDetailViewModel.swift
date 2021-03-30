//
//  RecipeDetailViewModel.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 24/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol RecipeDetailViewModelDelegate: class {
    func displayAlert(for type: AlertType)
}

final class RecipeDetailViewModel {

    private var repository: CookBookRepositoryType

    private var delegate: RecipeDetailViewModelDelegate?

    // MARK: - Initializer

    init(authmanager: CookBookRepositoryType, delegate: RecipeDetailViewModelDelegate?) {
        self.repository = authmanager
        self.delegate = delegate
    }

    // MARK: - Output

    // MARK: - Output

    var imageText: ((String) -> Void)?
    var timeText: ((String) -> Void)?
    var categoryText: ((String) -> Void)?
    var yieldText: ((String) -> Void)?
    var nameRecipeText: ((String) -> Void)?
    var ingredientRecipeText: ((String) -> Void)?
    var descriptionRecipeText: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
    }

    func viewDidAppear() {
        
    }


    
}
