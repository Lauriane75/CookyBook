//
//  Context.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

final class Context {

    let client: HTTPClientType

    init(client: HTTPClientType) {
        self.client = client
    }
}
