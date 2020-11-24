//
//  HomeCollectionDataSource.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class HomeCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: Private properties

    private var widthView: CGFloat = 0
    private var heightView: CGFloat = 0

    // MARK: Public function

    func update(width: CGFloat, height: CGFloat) {
        self.widthView = width
        self.heightView = height * 0.8
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard 100 > indexPath.item else {
            return UICollectionViewCell() // Should be monitored
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell",
                                                      for: indexPath)
            as! HomeCollectionViewCell
        cell.configure()
        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout

      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
      }

      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


          return CGSize(width: widthView, height: heightView)
      }
}
