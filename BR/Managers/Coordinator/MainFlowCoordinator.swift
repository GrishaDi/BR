//
//  MainFlowCoordinator.swift
//  BR
//
//  Created by Grisha Diehl on 23.02.2023.
//

import Foundation
import UIKit

final class MainFlowCoordinator: Coordinator {
    private let screenFactory = ScreenFactory()
    var navigationController: UINavigationController?
    
    
    private let containerViewController = ContainerViewController()

    
    func start() {
        NotificationCenter.default.post(
            name: Notification.Name.SetupMainFlowScreen,
            object: nil)
    }
    
    public func eventOccurred(with type: CoordinatorsEvents) {
        switch type {
        case .mainFlow(.signOut):
            NotificationCenter.default.post(
                name: Notification.Name.SignOutAndShowSignIn,
                object: nil)
        default:
            break
        }
    }
}
