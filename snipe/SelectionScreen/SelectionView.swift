//
//  SelectionView.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//

import UIKit

class SelectionView: UIView {
    var selectedImageView: UIImageView!
    var submitButton: UIButton!
    var backwardButton: UIButton!
    var exitButton: UIButton!
    var titleLabel: UILabel!
    
    var selectedImage: UIImage?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpSelectedImageView()
        setUpButtons()
        setUpTitleLabel()
        
        // Default values
        selectedImage = UIImage(named: "cartoon") // Replace with actual image name
        updateUI()
    }
    
    func setUpTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "SELECTED"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .brown
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }

    func setUpSelectedImageView() {
        selectedImageView = UIImageView()
        selectedImageView.contentMode = .scaleAspectFill
        selectedImageView.clipsToBounds = true
        selectedImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(selectedImageView)
    }
    
    func setUpButtons() {
        // Backward Button (Left)
        backwardButton = UIButton(type: .system)
        if let backwardIcon = UIImage(named: "backward") { // Replace with your backward icon
            backwardButton.setImage(backwardIcon.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        backwardButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backwardButton)
        
        // Exit Button (Right)
        exitButton = UIButton(type: .system)
        if let exitIcon = UIImage(named: "exit") { // Replace with your exit icon
            exitButton.setImage(exitIcon.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(exitButton)
        
        // Submit Button
        submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = UIColor(white: 0.9, alpha: 1)  // Light gray background
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        submitButton.layer.cornerRadius = 25  // Rounded corners
        submitButton.layer.masksToBounds = true  // Ensure the content stays inside rounded corners
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(submitButton)
    }

    func updateUI() {
        if let image = selectedImage {
            selectedImageView.image = image
        }
        // Apply 45-degree rotation to the image
        selectedImageView.transform = CGAffineTransform(rotationAngle: .pi / -10)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Selected Image View
            selectedImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            selectedImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            selectedImageView.widthAnchor.constraint(equalToConstant: 200),
            selectedImageView.heightAnchor.constraint(equalToConstant: 300),
            
            // Backward Button (Top Left)
            backwardButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            backwardButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            backwardButton.widthAnchor.constraint(equalToConstant: 40),
            backwardButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Exit Button (Top Right)
            exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            exitButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            exitButton.widthAnchor.constraint(equalToConstant: 60),
            exitButton.heightAnchor.constraint(equalToConstant: 60),
            
            // Submit Button
            submitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            submitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            submitButton.widthAnchor.constraint(equalToConstant: 200),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
