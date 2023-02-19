//
//  SignUpViewController.swift
//  BR
//
//  Created by Grisha Diehl on 11.02.2023.
//

import UIKit

final class SignUpViewController: UIViewController {
    private let signUpView = SignUpView()
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Create Account"
        navigationController?.navigationBar.tintColor = .systemPurple
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:
                                                                    UIColor.systemPurple]
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(signUpView)
        let signInScreenElements = [signUpView.nameField, signUpView.emailField, signUpView.passwordField, signUpView.signUpButton]
        for element in signInScreenElements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signUpView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            signUpView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            signUpView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            
            signUpView.nameField.topAnchor.constraint(equalTo: signUpView.topAnchor, constant: 190),
            signUpView.nameField.widthAnchor.constraint(equalTo: signUpView.widthAnchor, multiplier: 0.60),
            signUpView.nameField.heightAnchor.constraint(equalToConstant: 36),
            signUpView.nameField.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            
            signUpView.emailField.topAnchor.constraint(equalTo: signUpView.nameField.bottomAnchor, constant: 14),
            signUpView.emailField.widthAnchor.constraint(equalTo: signUpView.widthAnchor, multiplier: 0.60),
            signUpView.emailField.heightAnchor.constraint(equalToConstant: 36),
            signUpView.emailField.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            
            signUpView.passwordField.topAnchor.constraint(equalTo: signUpView.emailField.bottomAnchor, constant: 14),
            signUpView.passwordField.widthAnchor.constraint(equalTo: signUpView.widthAnchor, multiplier: 0.60),
            signUpView.passwordField.heightAnchor.constraint(equalToConstant: 36),
            signUpView.passwordField.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            
            signUpView.signUpButton.topAnchor.constraint(equalTo: signUpView.passwordField.bottomAnchor, constant: 14),
            signUpView.signUpButton.widthAnchor.constraint(equalTo: signUpView.widthAnchor, multiplier: 0.40),
            signUpView.signUpButton.heightAnchor.constraint(equalToConstant: 36),
            signUpView.signUpButton.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
        ])
    }
}
