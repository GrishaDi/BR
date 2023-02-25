//
//  AuthFlowCoordinator.swift
//  BR
//
//  Created by Grisha Diehl on 23.02.2023.
//

import Foundation
import UIKit

final class AuthFlowCoordinator: Coordinator {
    private let moduleFactory = ScreenFactory()
    var navigationController: UINavigationController?
    
    
    private let containerViewController = ContainerViewController()
    
    
    func start() {
        NotificationCenter.default.post(
            name: Notification.Name.SetupAuthFlowScreen,
            object: nil)
    }
    
    func eventOccurred(with type: Event) {
        switch type {
        case .signInTapped:
            NotificationCenter.default.post(
                name: Notification.Name.ShowTabViewController,
                object: nil)
        case .showCreateAccountForm:
            NotificationCenter.default.post(
                name: Notification.Name.ShowSignUpViewController,
                object: nil)
        }
    }
}
