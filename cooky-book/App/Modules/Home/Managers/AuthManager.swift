//
//  HomeRepository.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 20/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Firebase
import FirebaseAuth

protocol AuthManagerType: class {
    func logIn(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void))
    func signup(email: String, password: String, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void))
    func getCurrentUser() -> String
    func signOut(completion: @escaping(() -> Void), failure: @escaping((_ error: String) -> Void))
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

    func getCurrentUser() -> String {
        return Auth.auth().currentUser?.email ?? ""
    }


    func signOut(completion: @escaping(() -> Void), failure: @escaping((_ error: String) -> Void)) {
        do {
            try Auth.auth().signOut()
            completion()
        } catch {
            failure(error.localizedDescription)
        }
    }

}


