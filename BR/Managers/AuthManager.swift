//
//  AuthManager.swift
//  BR
//
//  Created by Grisha Diehl on 16.03.2023.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    static let shared = AuthManager()
    
    private let auth = Auth.auth()
    
    private init() {}
    
    public func signUp(
        email: String,
        password: String,
        completion: @escaping (Bool) -> Void
    ) {
        
    }
    
    public func signIn(
        email: String,
        password: String,
        completion: @escaping (Bool) -> Void
    ) {
        
    }
    
    public func signOut(
        completion: (Bool) -> Void
    ) {
        do {
            try auth.signOut()
            completion(true)
        }
        catch {
            print(error)
            completion(false)
        }
    }
}