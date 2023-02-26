//
//  Coordinator.swift
//  BR
//
//  Created by Grisha Diehl on 18.02.2023.
//

import Foundation
import UIKit

enum CoordinatorsEvents {
    case authFlow(Auth)
    case mainFlow(Main)
    enum Auth {
        case signIn
        case showCreateAccountForm
    }
    enum Main {
        case signOut
    }
}

//typealias CoordinatorHandler = () -> ()

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
//    var flowCompletionHandler: CoordinatorHandler? { get set }

    func start()
    
    func eventOccurred(with type: CoordinatorsEvents)
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

extension Coordinator {
    func eventOccurred(with type: CoordinatorsEvents) {
        return
    }
}
