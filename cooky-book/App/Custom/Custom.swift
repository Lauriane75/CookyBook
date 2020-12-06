//
//  Custom.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 30/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class Custom {

    static func styleTextField(_ textfield: UITextField, bottomLineColor: CGColor, placeHolderText: String, placeHolderColor: UIColor) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0,
                                  y: textfield.frame.height - 2,
                                  width: textfield.frame.width - 40,
                                  height: 2)
        bottomLine.backgroundColor = bottomLineColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        textfield.attributedPlaceholder = NSAttributedString(string: placeHolderText,
                                                             attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }

    static func styleButton(_ button: UIButton, backgroundColor: UIColor, tintColor: UIColor) {
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 15.0
        button.tintColor = tintColor
    }

    static func styleHollowButton(_ button:UIButton, borderColor: CGColor, tintColor: UIColor) {
        button.layer.borderColor = borderColor
        button.layer.cornerRadius = 15.0
        button.tintColor = tintColor
    }
}
