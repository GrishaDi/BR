//
//  MainCoordinator.swift
//  BR
//
//  Created by Grisha Diehl on 18.02.2023.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
//    var isSignedIn = false

    public func start() {
        /*
         if isSignedIn {
            showMainFlow()
         } else {
            showSignIn()
         }
         */
        
        let vc = SignInViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }

    public func eventOccurred(with type: Event) {
        switch type {
        case .signInTapped:
            let vc = TabViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
//            vc.navigationItem.setHidesBackButton(true, animated: true)
        case .showCreateAccountForm:
            let vc = SignUpViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
