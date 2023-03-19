//
//  SignInView.swift
//  BR
//
//  Created by Grisha Diehl on 11.02.2023.
//

import UIKit

final class SignInView: UIView {    
    public let companyLogo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "companyLogo"))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
    
    public let companyTagline: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .systemRed
        label.text = "Think Bright, Be Rich."
        
        return label
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
        field.leftViewMode = .always
        field.placeholder = "Password"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
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
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemPurple
        label.text = ""
        
        return label
    }()
    
    public let signInButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        configuration.attributedTitle = AttributedString("Sign In", attributes: container)
        configuration.baseBackgroundColor = .systemRed
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()
    
    public let createAccountButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        configuration.baseBackgroundColor = .secondarySystemBackground
        configuration.attributedTitle = AttributedString("Create Account", attributes: container)
        configuration.subtitle = "BR brokers only"
        configuration.titleAlignment = .center
        configuration.cornerStyle = .large
        configuration.baseForegroundColor = .systemPurple
        configuration.attributedSubtitle?.foregroundColor = .systemGray
        
        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()


    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(companyLogo, companyTagline, emailField, passwordField, signInButton, createAccountButton, notificationMessageLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
