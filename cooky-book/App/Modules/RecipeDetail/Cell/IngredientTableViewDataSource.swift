//
//  IngredientTableViewSource.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 26/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class IngredientTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    // MARK: Private properties

    // MARK: Public function

    func update() {
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard 20 > indexPath.item else {
            return UITableViewCell() // Should be monitored
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell", for: indexPath) as! IngredientTableViewCell
        cell.configure()
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
