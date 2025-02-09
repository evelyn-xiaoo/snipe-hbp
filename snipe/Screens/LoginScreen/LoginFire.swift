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
                        // check if the user has not finished setting up account
                            // userid is not in users collection
                            // MARK: complete
                            // if true then
                        /*
                         let contVC = ContinueSignupController()
                         let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                             sceneDelegate?.window?.rootViewController = contVC
                         */
                        //else
                        let mainVC = ViewController()
                        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                            sceneDelegate?.window?.rootViewController = mainVC
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
