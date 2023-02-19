//
//  SignInViewModel.swift
//  BR
//
//  Created by Grisha Diehl on 11.02.2023.
//

import Foundation

final class SignInViewViewModel {
    weak var delegate: SignInDelegate?
    
    public func setViewDelegate(delegate: SignInDelegate) {
        self.delegate = delegate
    }
}

protocol SignInDelegate: AnyObject {

}
