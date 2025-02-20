//
//  SignupViewController.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import UIKit

class SignupViewController: UIViewController {
    let signupView = SignupView()
    
    override func loadView() {
        view = signupView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signupView.signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        signupView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func signupTapped() {
        print("Signup Tapped")
        
        
        // Check each field and add to the emptyFields array if empty
        if signupView.email.text?.isEmpty ?? true {
            print("")
        }
        else if signupView.password.text?.isEmpty ?? true {
            print("")
        }
        else if signupView.verifyPassword.text?.isEmpty ?? true {
            print("")
        }
        if (signupView.password.text != signupView.verifyPassword.text){
                print("passwords do not match")
        }
        else {
            registerNewUser()
        }
    }
    
    @objc func loginTapped() {
        print("Login Tapped")
        self.dismiss(animated: true)
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
