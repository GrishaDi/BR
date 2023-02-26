//
//  SettingsViewController.swift
//  BR
//
//  Created by Grisha Diehl on 19.02.2023.
//

import UIKit

final class SettingsViewController: UIViewController, Coordinating {
    private let settingsView = SettingsView()
    var coordinator: Coordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemBackground
        
        setUpView()
        buttonsSetup()
        setupNavigationBar()
        
        coordinator = MainFlowCoordinator()
     }
    
    private func setUpView() {
        view.addSubview(settingsView)
        let signInScreenElements = [settingsView, settingsView.deleteAccountButton, settingsView.signOutButton]
        for element in signInScreenElements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            settingsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            settingsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            
            settingsView.signOutButton.bottomAnchor.constraint(equalTo: settingsView.bottomAnchor, constant: -26),
            settingsView.signOutButton.centerXAnchor.constraint(equalTo: settingsView.centerXAnchor),
            settingsView.signOutButton.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 0.5),
            settingsView.signOutButton.heightAnchor.constraint(equalToConstant: 36),
            
            settingsView.deleteAccountButton.bottomAnchor.constraint(equalTo: settingsView.signOutButton.topAnchor, constant: -16),
            settingsView.deleteAccountButton.centerXAnchor.constraint(equalTo: settingsView.centerXAnchor),
            settingsView.deleteAccountButton.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 0.5),
            settingsView.deleteAccountButton.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .systemRed
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:
                                                                                UIColor.systemRed]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:
                                                                            UIColor.systemRed]
    }
    
    private func buttonsSetup(){
        settingsView.deleteAccountButton.addTarget(self, action: #selector(deleteAccount), for: .touchUpInside)
        settingsView.signOutButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)
    }
    
    @objc private func deleteAccount() {
        print("Delete Account Tapped")
        // delete acc
    }
    
    @objc private func signOut() {
        coordinator?.eventOccurred(with: .mainFlow(.signOut))
    }

}
