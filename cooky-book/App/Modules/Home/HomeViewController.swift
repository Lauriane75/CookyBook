//
//  ViewController.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 19/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlet

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Properties

    var viewModel: HomeViewModel!

    private lazy var collectionDataSource = HomeCollectionDataSource()

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

    private func bind(to viewModel: HomeViewModel) {
        viewModel.appNameText = { [weak self] text in
            guard let self = self else { return }
            self.appNameLabel.text = text
        }
    }

    // MARK: - View actions

    @IBAction func didPressMessageButton(_ sender: Any) {
    }
    
    @IBAction func didPressHeartButton(_ sender: Any) {
    }
    
    // MARK: - Private Files



}

