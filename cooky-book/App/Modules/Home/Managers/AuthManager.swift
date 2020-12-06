//
//  HomeRepository.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import CoreData
import Firebase
import FirebaseAuth

protocol AuthManagerType: class {
    func logIn(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void))
    func signup(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void))
}

final class AuthManager: AuthManagerType {

    // MARK: - Properties

    private let token = Token()
    private let context: Context

    // MARK: - Initializer

    init(context: Context) {
        self.context = context
    }

    func logIn(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            completion(user, error)
        }
    }

    func signup(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            completion(authResult, error)
        }
    }

//    func saveUser(firstName: String, lastName: String, email: String, password: String, result: AuthDataResult?, completion: @escaping((_ error: Error?) -> Void)) {
//        dataBase.collection("users").addDocument(data: [
//            "first-name": firstName,
//            "last-name": lastName,
//            "uid":  result!.user.uid,
//            "email": email,
//            "password": password
//        ]) { (Error) in
//            completion(Error)
//        }
//    }

}


