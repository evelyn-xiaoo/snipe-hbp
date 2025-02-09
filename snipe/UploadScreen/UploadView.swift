////
////  UploadView.swift
////  snipe
////
////  Created by Vivian Li on 2/8/25.
////
//

import UIKit

class UploadView: UIView {
    var polaroidContainerView: UIView!
    var polaroidImageView: UIImageView!
    var usernameLabel: UILabel!
    var saveButton: UIButton!
    var backwardButton: UIButton! // Backward arrow button
    var placeholders: [UIImageView] = []
    
    var selectedUsername: String?
    var currentPolaroidImage: UIImage?
    
    var groupLabel: UILabel!
    var groupDropdownButton: UIButton!
    var dropdownArrowImageView: UIImageView!
    
    var uploadLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpPolaroidContainerView()
        setUpButtons()
        setUpPlaceholders()
        setUpGroupDropdown()
        
        // Initialize uploadLabel here
        uploadLabel = UILabel()
        uploadLabel.text = "Upload As Submission"
        uploadLabel.font = UIFont.boldSystemFont(ofSize: 20)
        uploadLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(uploadLabel)
        
        // Default values (these should come from the previous page)
        selectedUsername = "@riko"
        currentPolaroidImage = UIImage(named: "cartoon") // Replace with actual image name
        
        updateUI()
    }
    
    func setUpPolaroidContainerView() {
        polaroidContainerView = UIView()
        polaroidContainerView.layer.borderColor = UIColor.lightGray.cgColor
        polaroidContainerView.layer.borderWidth = 30
        polaroidContainerView.layer.cornerRadius = 10
        polaroidContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(polaroidContainerView)
        
        polaroidImageView = UIImageView()
        polaroidImageView.contentMode = .scaleAspectFill
        polaroidImageView.clipsToBounds = true
        polaroidImageView.translatesAutoresizingMaskIntoConstraints = false
        polaroidContainerView.addSubview(polaroidImageView)
        
        // Username label under the polaroid
        usernameLabel = UILabel()
        usernameLabel.text = selectedUsername
        usernameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        usernameLabel.textColor = .black
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameLabel)
    }
    
    func setUpButtons() {
        // Save button (word button instead of icon)
        saveButton = UIButton(type: .system)
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(saveButton)
        
        // Backward button (to replace trash icon for delete action)
        backwardButton = UIButton(type: .system)
        if let backwardImage = UIImage(named: "backward") { // Replace with your backward arrow image name
            backwardButton.setImage(backwardImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            print("Backward arrow icon image not found!")
        }
        backwardButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backwardButton)
    }
    
    func setUpPlaceholders() {
        for i in 0..<3 {
            let placeholderImageView = UIImageView()
            placeholderImageView.backgroundColor = .lightGray
            placeholderImageView.contentMode = .scaleAspectFill
            placeholderImageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(placeholderImageView)
            placeholders.append(placeholderImageView)
        }
    }
    
    func setUpGroupDropdown() {
        groupDropdownButton = UIButton(type: .system)
        groupDropdownButton.setTitle("Group", for: .normal)
        groupDropdownButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        groupDropdownButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(groupDropdownButton)
        
        // Dropdown arrow icon
        dropdownArrowImageView = UIImageView(image: UIImage(named: "dropdown")) // Replace with your arrow icon
        dropdownArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        groupDropdownButton.addSubview(dropdownArrowImageView)

        // Change the size of the arrow icon
        let arrowSize: CGFloat = 10 // Adjust this value for desired size
        dropdownArrowImageView.widthAnchor.constraint(equalToConstant: arrowSize).isActive = true
        dropdownArrowImageView.heightAnchor.constraint(equalToConstant: arrowSize).isActive = true
    }
    
    func updateUI() {
        // Set the polaroid image and username
        if let image = currentPolaroidImage {
            polaroidImageView.image = image
        }
        usernameLabel.text = selectedUsername
    }
    
    // Layout constraints
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Group label and dropdown
            groupDropdownButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            groupDropdownButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Dropdown arrow icon
            dropdownArrowImageView.leadingAnchor.constraint(equalTo: groupDropdownButton.trailingAnchor, constant: 5),
            dropdownArrowImageView.centerYAnchor.constraint(equalTo: groupDropdownButton.centerYAnchor),
            
            // Polaroid container view
            polaroidContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            polaroidContainerView.topAnchor.constraint(equalTo: groupDropdownButton.bottomAnchor, constant: 25),
            polaroidContainerView.widthAnchor.constraint(equalToConstant: 200),
            polaroidContainerView.heightAnchor.constraint(equalToConstant: 250),
            
            // Polaroid image view
            polaroidImageView.topAnchor.constraint(equalTo: polaroidContainerView.topAnchor),
            polaroidImageView.leadingAnchor.constraint(equalTo: polaroidContainerView.leadingAnchor),
            polaroidImageView.trailingAnchor.constraint(equalTo: polaroidContainerView.trailingAnchor),
            polaroidImageView.bottomAnchor.constraint(equalTo: polaroidContainerView.bottomAnchor),
            
            // Username label
            usernameLabel.topAnchor.constraint(equalTo: polaroidContainerView.bottomAnchor, constant: -25),
            usernameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Upload title
            uploadLabel.topAnchor.constraint(equalTo: polaroidContainerView.topAnchor, constant: 300),
            uploadLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Save Button (bottom right)
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.widthAnchor.constraint(equalToConstant: 80),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Backward Button (top left)
            backwardButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            backwardButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            backwardButton.widthAnchor.constraint(equalToConstant: 40),
            backwardButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Placeholders
            placeholders[0].topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 100),
            placeholders[0].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            placeholders[0].widthAnchor.constraint(equalToConstant: 120),
            placeholders[0].heightAnchor.constraint(equalToConstant: 120),
            
            placeholders[1].topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 100),
            placeholders[1].centerXAnchor.constraint(equalTo: self.centerXAnchor),
            placeholders[1].widthAnchor.constraint(equalToConstant: 120),
            placeholders[1].heightAnchor.constraint(equalToConstant: 120),
            
            placeholders[2].topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 100),
            placeholders[2].trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            placeholders[2].widthAnchor.constraint(equalToConstant: 120),
            placeholders[2].heightAnchor.constraint(equalToConstant: 120),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

