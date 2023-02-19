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

protocol Coordinator {
    var navigationController: UINavigationController? { get set }

    func start()
    
    func eventOccurred(with type: Event)
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
