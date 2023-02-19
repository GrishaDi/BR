//
//  SignUpViewViewModel.swift
//  BR
//
//  Created by Grisha Diehl on 19.02.2023.
//

import Foundation

final class SignUpViewViewModel {
    weak var delegate: SignUpDelegate?
    
    public func setViewDelegate(delegate: SignUpDelegate) {
        self.delegate = delegate
    }
}

protocol SignUpDelegate: AnyObject {

}
