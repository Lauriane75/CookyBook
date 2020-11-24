//
//  CookBookRepository.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import CoreData

protocol CookBookRepositoryType: class {

}

final class CookBookRepository: CookBookRepositoryType {

    // MARK: - Properties

    private let token = Token()
    private let context: Context

    // MARK: - Initializer

    init(context: Context) {
        self.context = context
    }

}
