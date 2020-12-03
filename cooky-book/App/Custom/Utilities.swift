//
//  Utilities.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 30/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

class Utilities {

    static func isPasswordValid(_ password : String) -> Bool {
        // regular expression passed by a boolean
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
