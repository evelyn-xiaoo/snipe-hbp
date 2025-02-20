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
    
    var emailLine: UIView!
    var passwordLine: UIView!
    var verifyLine: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpTextFields()
        setUpButtons()
        
        initConstraints()
    }
    
    func setUpTextFields() {
        email = UITextField()
        email.placeholder = "Email"
        email.translatesAutoresizingMaskIntoConstraints = false
        
        emailLine = UIView()
        emailLine.backgroundColor = .black
        emailLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailLine)
        
        password = UITextField()
        password.placeholder = "Password"
        
        //create a button to show password
        password.isSecureTextEntry = true
        
        password.translatesAutoresizingMaskIntoConstraints = false
        
        passwordLine = UIView()
        passwordLine.backgroundColor = .black
        passwordLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordLine)
        
        verifyPassword = UITextField()
        verifyPassword.placeholder = "Verify Password"
        verifyPassword.isSecureTextEntry = true
        verifyPassword.translatesAutoresizingMaskIntoConstraints = false
        
        verifyLine = UIView()
        verifyLine.backgroundColor = .black
        verifyLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(verifyLine)
        
        self.addSubview(email)
        self.addSubview(password)
        self.addSubview(verifyPassword)
    }
    
    func setUpButtons() {
        signupButton = UIButton(type: .system)
        signupButton.setTitle( "Sign Up", for: .normal)
        signupButton.titleLabel?.font = UIFont(name: "LondrinaShadow-Regular", size: 32) ?? UIFont.systemFont(ofSize: 32)
        signupButton.setTitleColor(.black, for: .normal)
        
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Have an account? Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        
        //VERY IMPORTANT
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(signupButton)
        self.addSubview(loginButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            email.bottomAnchor.constraint(equalTo: emailLine.topAnchor, constant: -5),
            email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            email.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            
            emailLine.bottomAnchor.constraint(equalTo: password.topAnchor, constant: -10),
            emailLine.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            emailLine.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            emailLine.heightAnchor.constraint(equalToConstant: 1),
            
            password.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            password.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            password.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            
            passwordLine.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            passwordLine.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 5),
            passwordLine.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            passwordLine.heightAnchor.constraint(equalToConstant: 1),
            
            verifyPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            verifyPassword.topAnchor.constraint(equalTo: passwordLine.bottomAnchor, constant: 10),
            verifyPassword.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            
            
            verifyLine.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            verifyLine.topAnchor.constraint(equalTo: verifyPassword.bottomAnchor, constant: 5),
            verifyLine.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            verifyLine.heightAnchor.constraint(equalToConstant: 1),
            
            signupButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            signupButton.topAnchor.constraint(equalTo: verifyPassword.bottomAnchor, constant: 30),
            
            loginButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -60)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
