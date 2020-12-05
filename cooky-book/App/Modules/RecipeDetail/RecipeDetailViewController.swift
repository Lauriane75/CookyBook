//
//  RecipeDetailViewController.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 24/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var userProfilImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var hearButton: UIButton!
    @IBOutlet weak var thumbUpButton: UIButton!
    @IBOutlet weak var numberOfLikeLabel: UILabel!
    @IBOutlet weak var numberOfPeopleWhoDidThis: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var stepsTextView: UITextView!

    // MARK: - Properties

    var viewModel: RecipeDetailViewModel!

    private var ingredientDataSource = IngredientTableViewDataSource()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()

        ingredientTableView.delegate = ingredientDataSource
        ingredientTableView.dataSource = ingredientDataSource

    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.viewDidAppear()

    }

    // MARK: - Private Functions


    // MARK: - View actions

    @IBAction func didPressEditButton(_ sender: Any) {
        print("didPressEditButton")
    }

    @IBAction func didPressHeartButton(_ sender: Any) {
        print("didPressHeartButton")
    }

    @IBAction func didPressThumbUpButton(_ sender: Any) {
        print("didPressHeartButton")
    }
}
