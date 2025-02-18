//
//  ContinueSignupFire.swift
//  snipe
//
//  Created by Madison Weiss on 2/8/25.
//

import FirebaseFirestore
import FirebaseAuth

extension ContinueSignupController {
    func uploadToFirestore() {
        if let name = continueSignUpView.name.text,
           let username = continueSignUpView.username.text,
           let bio = continueSignUpView.bio.text {
            let userId = Auth.auth().currentUser!.uid
            let newUser = FirestoreUser(id: userId, name: name, bio: bio, username: username)
            self.connectToFirestore(newUser: newUser)
        }
    }
    
    func connectToFirestore(newUser: FirestoreUser) {
        // Reference to Firestore
        let db = Firestore.firestore()
        print(newUser.id)
        // Firestore document reference using user ID
        let userDocRef = db.collection("users").document(newUser.id)
        
        // Set the data for the document
        userDocRef.setData([
            "name": newUser.name,
            "username": newUser.username,
            "bio": newUser.bio
        ]) { error in
            if let error = error {
                print("Error uploading user data: \(error)")
                // Handle error (maybe show alert)
            } else {
                print("User data uploaded successfully!")
                self.dismiss(animated: true)
                let mainVC = ViewController()
                let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
                    sceneDelegate?.window?.rootViewController = mainVC
                
            }
        }
    }
}

