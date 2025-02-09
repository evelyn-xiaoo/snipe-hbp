//
//  TakenPhotoViewController.swift
//  snipe
//
//  Created by Vivian Li on 2/8/25.

import UIKit

class TakenPhotoViewController: UIViewController {
    let takenPhotoView = TakenPhotoView()

    override func loadView() {
        view = takenPhotoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup actions for buttons
        takenPhotoView.exitButton.addTarget(self, action: #selector(confirmExit), for: .touchUpInside)
        takenPhotoView.nextButton.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
    }

    // Show confirmation alert for exit and deleting the photo
    @objc func confirmExit() {
        let alert = UIAlertController(title: "Are you sure?", message: "Are you sure you want to exit and delete the picture?", preferredStyle: .alert)
        
        // Cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Confirm exit and delete
        alert.addAction(UIAlertAction(title: "Yes, Exit", style: .destructive, handler: { [weak self] _ in
            self?.deletePhotoAndExit()
        }))
        
        present(alert, animated: true)
    }
    
    // Delete the photo and navigate back to home page
    func deletePhotoAndExit() {
        // Print a confirmation that the photo will be saved (but not actually saving it)
        if let image = takenPhotoView.polaroidImageView.image {
            print("Image will be saved: \(image)") // Just a console confirmation
        }
        
        // Clear the image from the view (delete photo)
        takenPhotoView.polaroidImageView.image = nil
        
        // Optionally, add code to clear any other related photo data, like username or associated data
        
        print("Photo deleted")
        
        // Navigate to the home page (replace with your home view controller)
        self.navigationController?.popToRootViewController(animated: true) // This will take you back to the root (home) view
    }

    // Handle go to next
    @objc func goToNext() {
        print("Going to next")
        // Your logic for the next view goes here
    }
}
