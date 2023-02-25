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
    
    func eventOccurred(with type: Event) {
        
    }
}
