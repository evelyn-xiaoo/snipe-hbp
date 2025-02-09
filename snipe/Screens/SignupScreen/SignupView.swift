//
//  SignupView.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import UIKit

class SignupView: UIView {
    var email: UITextField!
    var password: UITextField!
    var verifyPassword: UITextField!
    
    var signupButton: UIButton!
    
    var loginButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        
        setUpTextFields()
        setUpButtons()
        
        initConstraints()
    }
    
    func setUpTextFields() {
        email = UITextField()
        email.placeholder = "Email"
        email.translatesAutoresizingMaskIntoConstraints = false
        
        password = UITextField()
        password.placeholder = "Password"
        
        //create a button to show password
        password.isSecureTextEntry = true
        
        password.translatesAutoresizingMaskIntoConstraints = false
        
        verifyPassword = UITextField()
        verifyPassword.placeholder = "Verify Password"
        verifyPassword.isSecureTextEntry = true
        verifyPassword.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(email)
        self.addSubview(password)
        self.addSubview(verifyPassword)
    }
    
    func setUpButtons() {
        signupButton = UIButton(type: .system)
        signupButton.setTitle( "Sign Up", for: .normal)
        signupButton.setTitleColor(.blue, for: .normal)
        
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Have an account? Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        
        //VERY IMPORTANT
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(signupButton)
        self.addSubview(loginButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            email.bottomAnchor.constraint(equalTo: password.topAnchor, constant: -10),
            email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            password.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            password.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            verifyPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            verifyPassword.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10),
            
            signupButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            signupButton.topAnchor.constraint(equalTo: verifyPassword.bottomAnchor, constant: 20),
            
            loginButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
