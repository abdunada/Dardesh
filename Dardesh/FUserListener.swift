//
//  FUserListener.swift
//  Dardesh
//
//  Created by Abdelrahman Nada on 24/12/2021.
//

import Foundation
import Firebase

class FUserListener {
    static let shared = FUserListener()

    private init () {}
    
    // MARK: -  Login
    
    // MARK: - Register
    func registerUserWith (email: String, password: String, completion: @escaping (_ error: Error?) ->Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { [self] (authResult, error) in
            completion(error)
            
            if error == nil {
                authResult!.user.sendEmailVerification { (error) in
                    completion(error)
                }
            }
            
            if authResult?.user != nil {
                
                let user = User(username: email , email: email, status: "Hey, I'm using Dardesh.", id: authResult!.user.uid, pushId: "", avaterLink: "")
                saveUserToFirestore(user)
            }
        }
    }
    // MARK: - Save to Firestore
    private func saveUserToFirestore(_ user: User) {
        do {
            try FireStoreReference(.User).document(user.id).setData(from: user)
        } catch {
            print(error.localizedDescription)
        }
    }
}
