//
//  ScreenFactory.swift
//  BR
//
//  Created by Grisha Diehl on 23.02.2023.
//

import UIKit

protocol ScreenFactoryProtocol {
    func createSignInScreen() -> SignInViewController
    func createSignUpScreen() -> SignUpViewController
    func createTabViewModule() -> TabViewController
}

final class ScreenFactory: ScreenFactoryProtocol  {
    func createSignInScreen() -> SignInViewController {
        SignInViewController()
    }
    
    func createSignUpScreen() -> SignUpViewController {
        SignUpViewController()
    }
    
    func createTabViewModule() -> TabViewController {
        TabViewController()
    }
}
