//
//  LoginViewController.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    override func loadView() {
        print("in login view")
        view = loginView
    }

    override func viewDidLoad() {
        print("login view loaded")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginView.createAccountButton.addTarget(self, action: #selector(createAccountTapped), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc func createAccountTapped() {
        print("create account tapped")
        let signupViewController = SignupViewController()
        signupViewController.modalPresentationStyle = .fullScreen
        self.present(signupViewController, animated: true)
    }
    
    @objc func loginTapped() {
        print("login tapped")
        loginUser()
    }

}
