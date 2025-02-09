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
            self.connectToFirestorm(newUser: newUser)
        }
    }
    
    func connectToFirestorm(newUser: FirestoreUser) {
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
                self.uploadProfilePhotoToStorage(newUser: newUser)
                // Handle error (maybe show alert)
            } else {
                print("User data uploaded successfully!")
                let cameraViewController = ViewController()
                cameraViewController.modalPresentationStyle = .fullScreen
                self.present(cameraViewController, animated: true)
                // Perform any additional actions, like transitioning to the next screen
            }
        }
    }
    
    // Simplified method to upload the profile photo to Firebase Storage and update Firestore
    func uploadProfilePhotoToStorage(newUser: FirestoreUser) {
        // Only upload the photo if there's one selected
        if let image = pickedImage, let jpegData = image.jpegData(compressionQuality: 0.8) {
            let storageRef = storage.reference()
            let imagesRepo = storageRef.child("imagesUsers")
            let imageRef = imagesRepo.child("\(newUser.id).jpg")
            
            // Upload image data to Firebase Storage
            imageRef.putData(jpegData) { metadata, error in
                if let error = error {
                    print("Error uploading image: \(error)")
                    return
                }
                
                // Once the image is uploaded, retrieve the download URL
                imageRef.downloadURL { url, error in
                    if let error = error {
                        print("Error retrieving image URL: \(error)")
                        return
                    }
                    
                    // If URL is successfully retrieved, update Firestore with the image URL
                    if let imageUrl = url {
                        self.updateUserProfileInFirestore(newUser: newUser, avatarURL: imageUrl.absoluteString)
                    }
                }
            }
        } else {
            // If no image, just update Firestore without an avatar URL
            updateUserProfileInFirestore(newUser: newUser, avatarURL: "")
        }
    }
    
    // Method to update the user's Firestore document with the profile image URL
    func updateUserProfileInFirestore(newUser: FirestoreUser, avatarURL: String) {
        let db = Firestore.firestore()
        let userDocRef = db.collection("users").document(newUser.id)
        
        // Update Firestore user document with avatar URL (and other details)
        userDocRef.setData([
            "name": newUser.name,
            "username": newUser.username,
            "bio": newUser.bio,
            "avatarURL": avatarURL
        ]) { error in
            if let error = error {
                print("Error uploading user data: \(error)")
            } else {
                print("User data uploaded successfully!")
                self.navigateToHomeScreen(newUser: newUser)
            }
        }
    }
    
    // Navigate to the home screen after successful profile update
    func navigateToHomeScreen(newUser: FirestoreUser) {
        let homeController = ViewController()
        homeController.modalPresentationStyle = .fullScreen
        self.present(homeController, animated: true)
    }
}
