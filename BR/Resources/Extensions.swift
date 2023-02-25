//
//  Extensions.swift
//  BR
//
//  Created by Grisha Diehl on 11.02.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

extension Notification.Name {
    static let SetupAuthFlowScreen = Notification.Name("setupAuthFlowScreen")
    static let SetupMainFlowScreen = Notification.Name("setupMainFlowScreen")
    static let ShowSignUpViewController = Notification.Name("showSignUpViewController")
    static let ShowTabViewController = Notification.Name("showTabViewController")
}
