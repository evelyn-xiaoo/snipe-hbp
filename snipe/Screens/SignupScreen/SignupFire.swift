//
//  SignupFire.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import FirebaseAuth

extension SignupViewController {
    func registerNewUser() {
        if let email = signupView.email.text,
           let password = signupView.password.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    print("add user to firebase")
                    print("signup tapped")
                    let continueSignUpViewController = ContinueSignupController()
                    continueSignUpViewController.modalPresentationStyle = .fullScreen
                    self.present(continueSignUpViewController, animated: true)
                } else{
                    //MARK: there is a error creating the user...
                    print(error)
                    print("error creating user")
                }
            })
        }
    }
}
