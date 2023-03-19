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
        view.alpha = 0
        view.backgroundColor = .systemBackground
        setUpView()
        buttonsSetup()
        coordinator = AuthFlowCoordinator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIView.animate(withDuration: 0.9) {
            self.view.alpha = 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        view.alpha = 0
    }
    
    private func setUpView() {
        view.addSubview(signInView)
        let signInScreenElements = [signInView, signInView.companyLogo, signInView.companyTagline, signInView.emailField, signInView.passwordField, signInView.signInButton, signInView.createAccountButton, signInView.notificationMessageLabel]
        for element in signInScreenElements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            signInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signInView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            signInView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            signInView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            
            signInView.companyLogo.topAnchor.constraint(equalTo: signInView.topAnchor, constant: 44),
            signInView.companyLogo.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            signInView.companyLogo.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.15),
            signInView.companyLogo.heightAnchor.constraint(equalTo: signInView.companyLogo.widthAnchor),
            
            signInView.companyTagline.topAnchor.constraint(equalTo: signInView.companyLogo.bottomAnchor, constant: 8),
            signInView.companyTagline.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            signInView.companyTagline.widthAnchor.constraint(equalTo: signInView.widthAnchor),
            signInView.companyTagline.heightAnchor.constraint(equalToConstant: 20),
            
            signInView.notificationMessageLabel.topAnchor.constraint(equalTo: signInView.companyTagline.bottomAnchor, constant: 10),
            signInView.notificationMessageLabel.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.6),
            signInView.notificationMessageLabel.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            signInView.notificationMessageLabel.bottomAnchor.constraint(equalTo: signInView.emailField.topAnchor, constant: -10),
            
            signInView.emailField.topAnchor.constraint(equalTo: signInView.companyTagline.bottomAnchor, constant: 65),
            signInView.emailField.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.65),
            signInView.emailField.heightAnchor.constraint(equalToConstant: 36),
            signInView.emailField.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            
            signInView.passwordField.topAnchor.constraint(equalTo: signInView.emailField.bottomAnchor, constant: 14),
            signInView.passwordField.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.65),
            signInView.passwordField.heightAnchor.constraint(equalToConstant: 36),
            signInView.passwordField.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            
            signInView.signInButton.topAnchor.constraint(equalTo: signInView.passwordField.bottomAnchor, constant: 14),
            signInView.signInButton.widthAnchor.constraint(equalTo: signInView.widthAnchor, multiplier: 0.40),
            signInView.signInButton.heightAnchor.constraint(equalToConstant: 36),
            signInView.signInButton.centerXAnchor.constraint(equalTo: signInView.centerXAnchor),
            
            signInView.createAccountButton.topAnchor.constraint(equalTo: signInView.signInButton.bottomAnchor, constant: 28),
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
        guard let email = signInView.emailField.text, !email.isEmpty,
              let password = signInView.passwordField.text, !password.isEmpty else {
            signInView.notificationMessageLabel.text = "Wrong email/password or unverified email."
            return
        }
            
        AuthManager.shared.signIn(email: email, password: password) { [weak self] success in
            guard success else {
                return
            }
                        
            DispatchQueue.main.async {
                self?.coordinator?.eventOccurred(with: .authFlow(.signIn))
            }
        }
    }
    
    @objc private func showCreateAccountForm() {
        coordinator?.eventOccurred(with: .authFlow(.showCreateAccountForm))
    }
}

