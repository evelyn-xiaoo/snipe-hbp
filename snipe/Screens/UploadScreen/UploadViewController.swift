//
//  UploadViewController.swift
//  snipe
//
//  Created by Vivian Li on 2/8/25.
//

import UIKit

class UploadViewController: UIViewController {
    let uploadView = UploadView()

    override func loadView() {
        view = uploadView
        view.backgroundColor = .white  // Ensure the background is white for visibility
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ensure constraints are applied after the view is loaded
        uploadView.initConstraints()
        uploadView.layoutIfNeeded()  // Force layout update
        
        // Setup action handlers for buttons and placeholders
        uploadView.saveButton.addTarget(self, action: #selector(savePhoto), for: .touchUpInside)
        
        // Add gesture recognizers for each placeholder image
        for (index, placeholder) in uploadView.placeholders.enumerated() {
            placeholder.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(photoTapped(_:))))
            placeholder.isUserInteractionEnabled = true // Make sure the placeholder is tappable
        }
        
        // Group Dropdown button action
        uploadView.groupDropdownButton.addTarget(self, action: #selector(showGroupDropdown), for: .touchUpInside)
        
        // Backward Button action (replaces trash/delete functionality)
        uploadView.backwardButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }

    // Handle saving the photo to the selected placeholder
    @objc func savePhoto() {
        // Find the first placeholder that has an image and save it
        for (index, placeholder) in uploadView.placeholders.enumerated() {
            if let image = placeholder.image {
                // Save this image to the first placeholder in the list
                // For example, you could save it somewhere (e.g., in a file or database)
                print("Saving image from placeholder \(index)")
                return  // Only save the first image found and exit the loop
            }
        }
        print("No image to save")
    }

    // Handle tapping on the placeholders (move the image into the tapped placeholder)
    @objc func photoTapped(_ sender: UITapGestureRecognizer) {
        if let tappedPlaceholder = sender.view as? UIImageView {
            // Ensure only one placeholder can have the image at a time
            for placeholder in uploadView.placeholders {
                placeholder.image = nil  // Clear all other placeholders
            }
            // Move the image into the tapped placeholder
            tappedPlaceholder.image = uploadView.currentPolaroidImage
        }
    }

    // Show group selection dropdown
    @objc func showGroupDropdown() {
        let groupActionSheet = UIAlertController(title: "Select Group", message: nil, preferredStyle: .actionSheet)
        
        // Example groups for demonstration
        let groups = ["Group 1", "Group 2", "Group 3"]
        for group in groups {
            groupActionSheet.addAction(UIAlertAction(title: group, style: .default, handler: { _ in
                self.uploadView.groupDropdownButton.setTitle(group, for: .normal)
            }))
        }
        
        groupActionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(groupActionSheet, animated: true, completion: nil)
    }

    // Go back (replaces delete confirmation logic)
    @objc func goBack() {
        // Dismiss the current view or pop from the navigation stack
        self.navigationController?.popViewController(animated: true)
    }
}
