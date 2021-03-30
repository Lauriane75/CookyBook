//
//  DataBaseManager.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 07/12/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import FirebaseFirestore
import Firebase

protocol DataBaseManagerType: class {
    func saveUser(firstName: String, lastName: String, email: String, password: String, result: AuthDataResult?, completion: @escaping((_ error: Error?) -> Void))
}

final class DataBaseManager: DataBaseManagerType {

    // MARK: - Properties

    private let token = Token()
    private let context: Context
    private let dataBase = Firestore.firestore()

    // MARK: - Initializer

    init(context: Context) {
        self.context = context
    }

    func saveUser(firstName: String, lastName: String, email: String, password: String, result: AuthDataResult?, completion: @escaping((_ error: Error?) -> Void)) {
        dataBase.collection("users").addDocument(data: [
            "first-name": firstName,
            "last-name": lastName,
            "uid":  result!.user.uid,
            "email": email,
            "password": password
        ]) { (Error) in
            completion(Error)
        }
    }
}
