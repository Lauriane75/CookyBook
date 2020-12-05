//
//  CookBookCollectionDataSource.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 21/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class CookBookCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: Private properties

    private var widthView: CGFloat = 0
    private var heightView: CGFloat = 0

    var selectedRecipe: ((Int) -> Void)?

    // MARK: Public function

    func update(width: CGFloat, height: CGFloat) {
        self.widthView = width
        self.heightView = height
    }

    // MARK: - UITCollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard 9 > indexPath.item else {
            return UICollectionViewCell() // Should be monitored
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CookBookCollectionViewCell",
                                                      for: indexPath)
            as! CookBookCollectionViewCell
        cell.configure()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRecipe?(indexPath.row)
    }

    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let height = heightView
        let width = widthView
        let cellsize = (height < width) ?  bounds.height/3 : bounds.width/3

        return CGSize(width: cellsize - 1, height:  cellsize - 1)
    }
}
