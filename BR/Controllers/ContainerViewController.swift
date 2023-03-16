//
//  ContainerViewController.swift
//  BR
//
//  Created by Grisha Diehl on 24.02.2023.
//

import UIKit

final class ContainerViewController: UIViewController {
    private let signInVC = SignInViewController()
    private let signUpVC = SignUpViewController()
    private let tabVC = TabViewController()
    
    var navVC = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         navVC = UINavigationController(rootViewController: signInVC)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(setupAuthFlowScreen),
            name: Notification.Name.SetupAuthFlowScreen,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(setupMainFlowScreen),
            name: Notification.Name.SetupMainFlowScreen,
            object: nil)
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showSignUpViewController),
            name: Notification.Name.ShowSignUpViewController,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showTabViewController),
            name: Notification.Name.ShowTabViewController,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(signOutAndShowSignIn),
            name: Notification.Name.SignOutAndShowSignIn,
            object: nil)
        }

    @objc
    public func setupAuthFlowScreen() {
        add(navVC)
    }
    
    @objc
    public func setupMainFlowScreen() {
        add(tabVC)
    }
    
    @objc
    public func showSignUpViewController() {
        navVC.pushViewController(signUpVC, animated: true)
    }
    
    @objc
    public func showTabViewController() {
        // TODO: - Add animation
        navVC.remove()
        add(tabVC)
    }
    
    @objc
    public func signOutAndShowSignIn() {
        // TODO: - Add animation
        tabVC.remove()
        add(navVC)
    }
}
