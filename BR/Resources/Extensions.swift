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
