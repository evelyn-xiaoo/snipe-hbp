//
//  LoginFire.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import FirebaseAuth
import UIKit

extension LoginViewController {
    func loginUser() {
        //MARK: sign in a Firebase user with email and password...
        if let email = loginView.emailTextField.text,
           let password = loginView.passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user login is successful...
                    if let currentUser = Auth.auth().currentUser {
                        let mainVC = ViewController()
                        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                            sceneDelegate?.window?.rootViewController = mainVC
                        
                        /*
                        if let userName = currentUser.displayName,
                           let userEmail = currentUser.email {
                            
                            // MARK: navigate back to home screen after logging in
                            self.getCurrentUserAndNavigate(userId: currentUser.uid)
                        } else {
                            // MARK: the current user displayName is not found from Firesbase Auth
                            self.showErrorAlert(message: "Invalid credentials. Please try again.")
                            self.hideActivityIndicator()
                        }
                        */
                    } else {
                        // MARK: the current user is not found from Firesbase Auth
                        showErrorAlert(message: "User not found", controller: LoginViewController())
                    }
                    
                } else{
                    //MARK: there is a error logging in the user...
                    print(error)
                }
            })
        }
    }
}
