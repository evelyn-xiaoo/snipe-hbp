//
//  CameraView.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import UIKit

class CameraView: UIView {
    var logOutButton: UIButton!
    
    var snipeHeader: UILabel!
    var groupButton: UIButton!
    var personCircleButton: UIButton!
    var cameraBox: UIView!  // Declare cameraBox as an instance variable
    var circle: UIView!     // Declare circle as an instance variable
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupViews()  // Set up label and image views

        
   //     setUpButtons()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Function to setup the label, buttons, and views
    private func setupViews() {
        let customRedColor = UIColor.red
        
        // Setup label
        snipeHeader = UILabel()
        snipeHeader.text = "snipe"
        snipeHeader.font = UIFont.systemFont(ofSize: 48)
        snipeHeader.textColor = customRedColor
        snipeHeader.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(snipeHeader)
        
        // Setup group button (left side)
        groupButton = UIButton(type: .system)
        if let groupImage = UIImage(named: "Groups") {
            groupButton.setImage(groupImage, for: .normal)
        }
        groupButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(groupButton)
        
        // Setup person circle button (right side)
        personCircleButton = UIButton(type: .system)
        if let personCircleImage = UIImage(named: "Profile") {
            personCircleButton.setImage(personCircleImage, for: .normal)
        }
        personCircleButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(personCircleButton)
        
        // Camera box setup
        cameraBox = UIView()
        cameraBox.translatesAutoresizingMaskIntoConstraints = false
        cameraBox.backgroundColor = .gray
        cameraBox.layer.cornerRadius = 15
        self.addSubview(cameraBox)
        
        // Large circle setup
        circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .white
        circle.layer.cornerRadius = 42.5
        circle.layer.borderWidth = 1
        circle.layer.borderColor = customRedColor.cgColor
        self.addSubview(circle)
    }
    
 /*  func setUpButtons() {
        logOutButton = UIButton(type: .system)
        logOutButton.setTitle("Log Out", for: .normal)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logOutButton)
    }*/
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            //logOutButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            //logOutButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            // Label Constraints
            snipeHeader.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            snipeHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            
            // Group button Constraints
            groupButton.trailingAnchor.constraint(equalTo: snipeHeader.leadingAnchor, constant: -50),
            groupButton.widthAnchor.constraint(equalToConstant: 50),
            groupButton.heightAnchor.constraint(equalTo: groupButton.widthAnchor),
            groupButton.centerYAnchor.constraint(equalTo: snipeHeader.centerYAnchor),
            
            // Person circle button Constraints
            personCircleButton.leadingAnchor.constraint(equalTo: snipeHeader.trailingAnchor, constant: 50),
            personCircleButton.widthAnchor.constraint(equalToConstant: 50),
            personCircleButton.heightAnchor.constraint(equalTo: personCircleButton.widthAnchor),
            personCircleButton.centerYAnchor.constraint(equalTo: snipeHeader.centerYAnchor),
            
            // Camera box Constraints
            cameraBox.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            cameraBox.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
            cameraBox.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cameraBox.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // Circle Constraints
            circle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            circle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120),
            circle.widthAnchor.constraint(equalToConstant: 85),
            circle.heightAnchor.constraint(equalToConstant: 85)
        ])
    }

}
