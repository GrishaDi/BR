//
//  MainCoordinator.swift
//  BR
//
//  Created by Grisha Diehl on 18.02.2023.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    private let mainCoordinator = MainFlowCoordinator()
    private let authCoordinator = AuthFlowCoordinator()
    
    private var childCoordinators = [Coordinator]()
    private var isSignedIn = false
    
    var navigationController: UINavigationController?

    public func start() {        
        if isSignedIn {
            mainCoordinator.start()
         } else {
             authCoordinator.start()
         }
    }
}
