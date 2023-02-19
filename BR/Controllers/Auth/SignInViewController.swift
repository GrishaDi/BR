//
//  ViewController.swift
//  BR
//
//  Created by Grisha Diehl on 11.02.2023.
//

import UIKit

final class SignInViewController: UIViewController, Coordinating {
    private let signInView = SignInView()
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpView()
        buttonsSetup()
    }
    
    private func setUpView() {
        view.addSubview(signInView)
        let signInScreenElements = [signInView, signInView.companyLogo, signInView.companyTagline, signInView.emailField, signInView.passwordField, signInView.signInButton, signInView.createAccountButton]
        for element in signInScreenElements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            signInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signInView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            signInView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            signInView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            
            signInView.companyLogo.topAnchor.constraint(equalTo: signInView.topAnchor, constant: 72),
            signInView.companyLogo.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            signInView.companyLogo.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.15),
            signInView.companyLogo.heightAnchor.constraint(equalTo: signInView.companyLogo.widthAnchor),
            
            signInView.companyTagline.topAnchor.constraint(equalTo: signInView.companyLogo.bottomAnchor, constant: 8),
            signInView.companyTagline.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            signInView.companyTagline.widthAnchor.constraint(equalTo: signInView.widthAnchor),
            signInView.companyTagline.heightAnchor.constraint(equalToConstant: 20),
            
            signInView.emailField.topAnchor.constraint(equalTo: signInView.companyTagline.bottomAnchor, constant: 65),
            signInView.emailField.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.60),
            signInView.emailField.heightAnchor.constraint(equalToConstant: 36),
            signInView.emailField.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            
            signInView.passwordField.topAnchor.constraint(equalTo: signInView.emailField.bottomAnchor, constant: 14),
            signInView.passwordField.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.60),
            signInView.passwordField.heightAnchor.constraint(equalToConstant: 36),
            signInView.passwordField.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            
            signInView.signInButton.topAnchor.constraint(equalTo: signInView.passwordField.bottomAnchor, constant: 14),
            signInView.signInButton.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.40),
            signInView.signInButton.heightAnchor.constraint(equalToConstant: 36),
            signInView.signInButton.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            
            signInView.createAccountButton.topAnchor.constraint(equalTo: signInView.signInButton.bottomAnchor, constant: 40),
            signInView.createAccountButton.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.40),
            signInView.createAccountButton.heightAnchor.constraint(equalToConstant: 40),
            signInView.createAccountButton.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
        ])
    }
    
    private func buttonsSetup(){
        signInView.signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        signInView.createAccountButton.addTarget(self, action: #selector(showCreateAccountForm), for: .touchUpInside)
    }
    
    @objc private func signIn() {
        coordinator?.eventOccurred(with: .signInTapped)
    }
    
    @objc private func showCreateAccountForm() {
        coordinator?.eventOccurred(with: .showCreateAccountForm)
    }
}

