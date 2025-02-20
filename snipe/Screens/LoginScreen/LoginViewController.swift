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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
