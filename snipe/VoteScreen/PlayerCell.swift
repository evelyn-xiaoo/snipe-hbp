//
//  PlayerCell.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var assassinTargetLabel: UILabel!
    var imageStackView: UIStackView!
    
    var selectedImage: UIImageView?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Disable cell selection highlight
        self.selectionStyle = .none
        
        setupWrapperCellView() // Initialize wrapperCellView
        setupAssassinTargetLabel()
        setupImageStackView()
        
        initConstraints()
        
        // Add gesture recognizer to detect tap on the entire cell
        let cellTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:)))
        self.addGestureRecognizer(cellTapGestureRecognizer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Initialize the wrapperCellView
    func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .white // White background for the wrapper
        wrapperCellView.layer.cornerRadius = 8 // Optional: Add rounded corners for the wrapper
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }

    // Gesture recognizer for detecting tap on the entire cell
    @objc func cellTapped(_ sender: UITapGestureRecognizer) {
        print("PlayerCell was tapped!")
        // Add more logic here, e.g., navigate to another view, or show more details
    }

    // Label for Assassin name and Target name
    func setupAssassinTargetLabel() {
        assassinTargetLabel = UILabel()
        assassinTargetLabel.font = UIFont.boldSystemFont(ofSize: 14)
        assassinTargetLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(assassinTargetLabel)
    }

    // Stack View for images (3 placeholders)
    func setupImageStackView() {
        imageStackView = UIStackView()
        imageStackView.axis = .horizontal
        imageStackView.spacing = 10
        imageStackView.distribution = .fillEqually
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageStackView)
        
        // Create 3 image placeholders in the stack with gray background and border to visualize grid
        for _ in 0..<3 {
            let imageView = UIImageView()
            imageView.backgroundColor = .lightGray // Set the placeholder color to light gray
            imageView.layer.borderColor = UIColor.black.cgColor // Add a black border
            imageView.layer.borderWidth = 1.0 // Border width to outline each placeholder
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.isUserInteractionEnabled = true
            
            // Set rounded corners for the image placeholder
            imageView.layer.cornerRadius = 15
            imageView.clipsToBounds = true
            
            imageStackView.addArrangedSubview(imageView)
            
            // Add gesture recognizer for selecting the image (tapping on each placeholder)
            let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.addGestureRecognizer(imageTapGesture)
        }
    }

    // Update the Assassin and Target label
    func configureCell(assassinName: String, targetName: String) {
        assassinTargetLabel.text = "\(assassinName) snipe \(targetName)"
    }
    
    // Handle image tap (selection)
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView {
            selectedImage = imageView
            imageView.backgroundColor = .blue // Visual feedback of selection
            print("Image tapped in cell")
        }
    }
    
    // Cell layout constraints
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Wrapper Cell View Constraints
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            // Assassin-Target Label Constraints
            assassinTargetLabel.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 10),
            assassinTargetLabel.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            assassinTargetLabel.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -10),
            
            // Image Stack View Constraints
            imageStackView.topAnchor.constraint(equalTo: assassinTargetLabel.bottomAnchor, constant: 10),
            imageStackView.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            imageStackView.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -10),
            imageStackView.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -10),
            imageStackView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
