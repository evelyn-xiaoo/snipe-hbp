//
//  ContinueSignupController.swift
//  snipe
//
//  Created by Madison Weiss on 2/8/25.
//

import UIKit

class ContinueSignupController: UIViewController {
    let continueSignUpView = ContinueSignupView()
    
    override func loadView() {
        view = continueSignUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueSignUpView.continueButton.addTarget(self, action: #selector(continuePressed), for: .touchUpInside)
    }
    
    @objc func continuePressed() {
        print("Continue Tapped")
        
        
        // Check each field and add to the emptyFields array if empty
        if continueSignUpView.name.text?.isEmpty ?? true {
            print("")
        }
        else if continueSignUpView.username.text?.isEmpty ?? true {
            print("")
        }
        else if continueSignUpView.bio.text?.isEmpty ?? true {
            print("")
        }
        else {
            uploadToFirestore()
        }
    }
    

}
