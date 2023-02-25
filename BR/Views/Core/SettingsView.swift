//
//  SettingsView.swift
//  BR
//
//  Created by Grisha Diehl on 25.02.2023.
//

import UIKit

final class SettingsView: UIView {

    public let signOutButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        configuration.attributedTitle = AttributedString("Sign Out", attributes: container)
        configuration.baseBackgroundColor = .systemRed
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()
    
    public let deleteAccountButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        configuration.attributedTitle = AttributedString("Delete Account", attributes: container)
        configuration.baseBackgroundColor = .systemRed
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(signOutButton, deleteAccountButton)
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

}
