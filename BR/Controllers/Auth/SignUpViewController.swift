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
        buttonsSetup()
        
        coordinator = AuthFlowCoordinator()
    }
    
    private func setUpView() {
        view.addSubview(signUpView)
        let signInScreenElements = [signUpView.nameField, signUpView.emailField, signUpView.passwordField, signUpView.signUpButton, signUpView.notificationMessageLabel]
        for element in signInScreenElements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signUpView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            signUpView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            signUpView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            
            signUpView.notificationMessageLabel.topAnchor.constraint(equalTo: signUpView.topAnchor, constant: 40),
            signUpView.notificationMessageLabel.widthAnchor.constraint(equalTo: signUpView.widthAnchor, multiplier: 0.4),
            signUpView.notificationMessageLabel.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            signUpView.notificationMessageLabel.bottomAnchor.constraint(equalTo: signUpView.nameField.topAnchor, constant: -40),
            
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
    
    private func buttonsSetup(){
        signUpView.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    @objc private func signUp() {
        guard let email = signUpView.emailField.text, !email.isEmpty,
              validateText(email,
                           errorMessage: "Only for users with @brightrich.ru domain.",
                           validationFunction: { $0.contains("@brightrich.ru") }),
              let password = signUpView.passwordField.text, !password.isEmpty,
              validateText(password,
                           errorMessage: "Password must be at least 6 characters long.",
                           validationFunction: { $0.count >= 6 }),
              let name = signUpView.nameField.text,
              validateText(name,
                           errorMessage: "Name & Surname.",
                           validationFunction: { $0.count >= 6 })
        else {
                  return 
              }
        
        AuthManager.shared.auth.fetchSignInMethods(forEmail: email) { [weak self] (signInMethods, error) in
            if let error = error {
                // An error occurred
                print("Error: \(error.localizedDescription)")
            } else if signInMethods != nil {
                self?.signUpView.notificationMessageLabel.text = "User with this email already exist."
            } else {
                AuthManager.shared.signUp(email: email, password: password) { success in
                    if success {
                        let newUser = User(name: name, email: email)
                        DatabaseManager.shared.insert(user: newUser) { inserted in
                            guard inserted else {
                                return
                            }
                            DispatchQueue.main.async {
                                self?.coordinator?.eventOccurred(with: .authFlow(.signIn))
                            }
                            print("Created")
                            self?.signUpView.nameField.text = ""
                            self?.signUpView.emailField.text = ""
                            self?.signUpView.passwordField.text = ""
                        }
                    } else {
                        print("Failed to create account")
                    }
                }
            }
        }
    }
    
    private func validateText(_ text: String, errorMessage: String, validationFunction: (String) -> Bool) -> Bool {
        guard validationFunction(text) else {
            signUpView.notificationMessageLabel.text = errorMessage
            return false
        }
        return true
    }
}
