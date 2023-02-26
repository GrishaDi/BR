//
//  SettingsView.swift
//  BR
//
//  Created by Grisha Diehl on 25.02.2023.
//

import UIKit

final class SettingsView: UIView {

    public let signOutButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        configuration.attributedTitle = AttributedString("Sign Out", attributes: container)
        configuration.baseForegroundColor = .systemRed
        configuration.background.strokeColor = .systemRed
        configuration.background.strokeWidth = 1.5
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()
    
    public let deleteAccountButton: UIButton = {
        var configuration = UIButton.Configuration.tinted()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        configuration.attributedTitle = AttributedString("Delete Account", attributes: container)
        configuration.baseBackgroundColor = .systemRed
        configuration.baseForegroundColor = .systemRed
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
