//
//  Coordinator.swift
//  BR
//
//  Created by Grisha Diehl on 18.02.2023.
//

import Foundation
import UIKit

enum Event {
    case signInTapped
    case showCreateAccountForm
}

//typealias CoordinatorHandler = () -> ()

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
//    var flowCompletionHandler: CoordinatorHandler? { get set }

    func start()
    
    func eventOccurred(with type: Event)
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
//enum Events {
//    enum AuthEvents {
//        case signInTapped
//        case showCreateAccountForm
//    }
//    enum MainFlowEvents {
//        case tapHere
//        case tapThere
//    }
//}

extension Coordinator {
    func eventOccurred(with type: Event) {
        return
    }
}
