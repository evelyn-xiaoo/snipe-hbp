//
//  LoginView.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import UIKit

class LoginView: UIView {
    var createAccountButton: UIButton!
    var loginButton: UIButton!
    
    var titleLabel: UILabel!
    var snipeLabel: UILabel!
    
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpButtons()
        setUpLabels()
        setUpFields()
        
        initConstraints()
    }
    
    func setUpButtons() {
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        createAccountButton = UIButton(type: .system)
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(.blue, for: .normal)
        
        //VERY IMPORTANT
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(loginButton)
        self.addSubview(createAccountButton)
    }
    
    func setUpLabels() {
        titleLabel = UILabel()
        let text = "get ready to"
        let attributes: [NSAttributedString.Key: Any] = [
            .kern: 12.5, // Adjust letter spacing (increase or decrease as needed)
            .font: UIFont(name: "Londrina Shadow", size: 36)! // Ensure the font is loaded
        ]

        titleLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        snipeLabel = UILabel()
        snipeLabel.text = "SNIPE"
        snipeLabel.textColor = .red
        snipeLabel.font = UIFont(name:"Inter", size:100)
        snipeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(snipeLabel)
    }
    
    func setUpFields() {
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailTextField)
        
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordTextField)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            snipeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            snipeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            
            emailTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: snipeLabel.bottomAnchor, constant: 20),
            
            passwordTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            
            loginButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            
            createAccountButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            createAccountButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 30)
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
