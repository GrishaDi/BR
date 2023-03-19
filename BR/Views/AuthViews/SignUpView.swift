//
//  SignUpView.swift
//  BR
//
//  Created by Grisha Diehl on 19.02.2023.
//

import UIKit

final class SignUpView: UIView {
    
    private let viewModel = SignUpViewViewModel()

    public let nameField: UITextField = {
        let field = UITextField()
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.placeholder = "Name & Surname"
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        
        return field
    }()
    
    public let emailField: UITextField = {
        let field = UITextField()
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Email@brightrich.ru"
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        
        return field
    }()
    
    public let passwordField: UITextField = {
        let field = UITextField()
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.placeholder = "Create Password"
        field.isSecureTextEntry = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        
        return field
    }()
    
    public let notificationMessageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .systemPurple
        label.text = ""
        
        return label
    }()
    
    public let signUpButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        configuration.attributedTitle = AttributedString("Verify", attributes: container)
        configuration.baseBackgroundColor = .systemPurple
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(nameField, emailField, passwordField, signUpButton, notificationMessageLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
