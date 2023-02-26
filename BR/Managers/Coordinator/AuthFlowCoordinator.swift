//
//  AuthFlowCoordinator.swift
//  BR
//
//  Created by Grisha Diehl on 23.02.2023.
//

import Foundation
import UIKit

final class AuthFlowCoordinator: Coordinator {
    private let containerViewController = ContainerViewController()
    var navigationController: UINavigationController?
    
    func start() {
        NotificationCenter.default.post(
            name: Notification.Name.SetupAuthFlowScreen,
            object: nil)
    }
    
    public func eventOccurred(with type: CoordinatorsEvents) {
        switch type {
        case .authFlow(.signIn):
            NotificationCenter.default.post(
                name: Notification.Name.ShowTabViewController,
                object: nil)
        case .authFlow(.showCreateAccountForm):
            NotificationCenter.default.post(
                name: Notification.Name.ShowSignUpViewController,
                object: nil)
        default:
            break
        }
    }
}
