import UIKit

class CameraScreen: UIView {

    var snipeHeader: UILabel!
    var groupButton: UIButton!
    var personCircleButton: UIButton!
    var cameraBox: UIView!  // Declare cameraBox as an instance variable
    var circle: UIView!     // Declare circle as an instance variable

    // Initializer for CameraScreen
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()  // Set up label and image views
        setupConstraints() // Setup constraints
    }
    
    // Required initializer (for storyboards, nib files, etc.)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()  // Set up label and image views
        setupConstraints() // Setup constraints
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
        addSubview(snipeHeader)
        
        // Setup group button (left side)
        groupButton = UIButton(type: .system)
        if let groupImage = UIImage(named: "Groups") {
            groupButton.setImage(groupImage, for: .normal)
        }
        groupButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(groupButton)
        
        // Setup person circle button (right side)
        personCircleButton = UIButton(type: .system)
        if let personCircleImage = UIImage(named: "Profile") {
            personCircleButton.setImage(personCircleImage, for: .normal)
        }
        personCircleButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(personCircleButton)
        
        // Camera box setup
        cameraBox = UIView()
        cameraBox.translatesAutoresizingMaskIntoConstraints = false
        cameraBox.backgroundColor = .gray
        cameraBox.layer.cornerRadius = 15
        addSubview(cameraBox)
        
        // Large circle setup
        circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .white
        circle.layer.cornerRadius = 42.5
        circle.layer.borderWidth = 1
        circle.layer.borderColor = customRedColor.cgColor
        addSubview(circle)
    }
    
    // Function to setup constraints for all UI elements
    private func setupConstraints() {
        NSLayoutConstraint.activate([
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

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}



//class CameraScreen: UIView {
//
//    var snipeHeader: UILabel!
//    var groupButton: UIButton!
//    var personCircleButton: UIButton!
//
//    // Initializer for CameraScreen
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .white
//        setupViews()  // Set up label and image views
//        setupConstraints() // Setup constraints
//    }
//
//    // Required initializer (for storyboards, nib files, etc.)
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupViews()  // Set up label and image views
//        setupConstraints() // Setup constraints
//    }
//
//    // Function to setup the label, buttons, and views
//    private func setupViews() {
//        let customRedColor = UIColor.red
//
//        // Setup label
//        snipeHeader = UILabel()
//        snipeHeader.text = "snipe"
//        snipeHeader.font = UIFont.systemFont(ofSize: 48)
//        snipeHeader.textColor = customRedColor
//        snipeHeader.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(snipeHeader)
//
//        // Setup group button (left side)
//        groupButton = UIButton(type: .system)
//        if let groupImage = UIImage(named: "Groups") {
//            groupButton.setImage(groupImage, for: .normal)
//        }
//        groupButton.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(groupButton)
//
//        // Setup person circle button (right side)
//        personCircleButton = UIButton(type: .system)
//        if let personCircleImage = UIImage(named: "Profile") {
//            personCircleButton.setImage(personCircleImage, for: .normal)
//        }
//        personCircleButton.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(personCircleButton)
//
//        // Camera box setup
//        let cameraBox = UIView()
//        cameraBox.translatesAutoresizingMaskIntoConstraints = false
//        cameraBox.backgroundColor = .gray
//        cameraBox.layer.cornerRadius = 15
//        addSubview(cameraBox)
//
//        // Large circle setup
//        let circle = UIView()
//        circle.translatesAutoresizingMaskIntoConstraints = false
//        circle.backgroundColor = .white
//        circle.layer.cornerRadius = 42.5
//        circle.layer.borderWidth = 1
//        circle.layer.borderColor = customRedColor.cgColor
//        addSubview(circle)
//    }
//
//    // Function to setup constraints for all UI elements
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            // Label Constraints
//            snipeHeader.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            snipeHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
//
//            // Group button Constraints
//            groupButton.trailingAnchor.constraint(equalTo: snipeHeader.leadingAnchor, constant: -50),
//            groupButton.widthAnchor.constraint(equalToConstant: 50),
//            groupButton.heightAnchor.constraint(equalTo: groupButton.widthAnchor),
//            groupButton.centerYAnchor.constraint(equalTo: snipeHeader.centerYAnchor),
//
//            // Person circle button Constraints
//            personCircleButton.leadingAnchor.constraint(equalTo: snipeHeader.trailingAnchor, constant: 50),
//            personCircleButton.widthAnchor.constraint(equalToConstant: 50),
//            personCircleButton.heightAnchor.constraint(equalTo: personCircleButton.widthAnchor),
//            personCircleButton.centerYAnchor.constraint(equalTo: snipeHeader.centerYAnchor),
//
//            // Camera box Constraints
//            cameraBox.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
//            cameraBox.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
//            cameraBox.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            cameraBox.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//
//            // Circle Constraints
//            circle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            circle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120),
//            circle.widthAnchor.constraint(equalToConstant: 85),
//            circle.heightAnchor.constraint(equalToConstant: 85)
//        ])
//    }
//}
//
//extension UIColor {
//    convenience init(hex: String) {
//        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//
//        if hexSanitized.hasPrefix("#") {
//            hexSanitized.remove(at: hexSanitized.startIndex)
//        }
//
//        var rgb: UInt64 = 0
//        Scanner(string: hexSanitized).scanHexInt64(&rgb)
//
//        self.init(
//            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgb & 0x0000FF) / 255.0,
//            alpha: 1.0
//        )
//    }
//}
//




/*
//OLD CODE

import UIKit

class CameraScreen: UIView {

    var snipeHeader: UILabel
    var groupButton: UIButton // Button for the person.2 symbol
    var personCircleButton: UIButton // Button for the person.circle symbol

    // Initializer for CameraScreen
    override init(frame: CGRect) {
        snipeHeader = UILabel()
        groupButton = UIButton(type: .system) // Initialize the person button
        personCircleButton = UIButton(type: .system) // Initialize the person.circle button
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupViews()  // Set up label and image views
    }
    
    // Required initializer (for storyboards, nib files, etc.)
    required init?(coder: NSCoder) {
        snipeHeader = UILabel()
        groupButton = UIButton(type: .system) // Initialize the person button
        personCircleButton = UIButton(type: .system) // Initialize the person.circle button
        super.init(coder: coder)

        setupViews()  // Set up label and image views
    }
    
    // Function to setup the label and image views
    private func setupViews() {
        // Define the custom color (#921010)
        let customRedColor = UIColor.red
        
        // Label setup
        snipeHeader.text = "snipe"
        snipeHeader.font = UIFont.systemFont(ofSize: 48)
        snipeHeader.textColor = customRedColor // Set the text color to custom red
        snipeHeader.translatesAutoresizingMaskIntoConstraints = false
        addSubview(snipeHeader)
        
  
        // Button setup for custom person photo (Left Side)
        if let groupImage = UIImage(named: "Groups") { // Replace "personPhoto" with your asset name
            groupButton.setImage(groupImage, for: .normal) // Set the image for normal state
        }
        groupButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(groupButton)
        
        // Button setup for custom person.circle photo (Right Side)
        if let personCircleImage = UIImage(named: "Profile") { // Replace "personCirclePhoto" with your asset name
            personCircleButton.setImage(personCircleImage, for: .normal) // Set the image for normal state
        }
        personCircleButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(personCircleButton)
        
        

        
        // Camera Box setup
        let cameraBox = UIView()
        cameraBox.translatesAutoresizingMaskIntoConstraints = false
        cameraBox.backgroundColor = .gray // Set the color of the camera viewer box
        cameraBox.layer.cornerRadius = 15 // Optional: Add rounded corners for the camera box
        addSubview(cameraBox)
        
        // Large Circle setup
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .white // Set the circle's color
        circle.layer.cornerRadius = 42.5 // Half of 85 to make it a perfect circle
        circle.layer.borderWidth = 1 // Set the thickness of the border
        circle.layer.borderColor = customRedColor.cgColor // Set the border color to custom red
        addSubview(circle)
        
        
     
        
        // Setting up Auto Layout constraints for Camera Box, Large Circle, Smaller Circles, and Buttons
        NSLayoutConstraint.activate([
            // Label Constraints
            snipeHeader.centerXAnchor.constraint(equalTo: self.centerXAnchor), // Horizontally center the label
            snipeHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: 65), // Position 50 points from the top
            
            // Person Button (person.2) Constraints (Position 50 left of the "snipe" label)
            groupButton.trailingAnchor.constraint(equalTo: snipeHeader.leadingAnchor, constant: -50), // 50 points left of the label
            groupButton.widthAnchor.constraint(equalToConstant: 50),
            groupButton.heightAnchor.constraint(equalTo: groupButton.widthAnchor),
            groupButton.centerYAnchor.constraint(equalTo: snipeHeader.centerYAnchor), // Vertically center with the label
            
            // Person Circle Button (person.circle) Constraints (Position 50 right of the "snipe" label)
            personCircleButton.leadingAnchor.constraint(equalTo: snipeHeader.trailingAnchor, constant: 50), // 50 points right of the label
            personCircleButton.widthAnchor.constraint(equalToConstant: 50),
            personCircleButton.heightAnchor.constraint(equalTo: personCircleButton.widthAnchor),
            personCircleButton.centerYAnchor.constraint(equalTo: snipeHeader.centerYAnchor), // Vertically center with the label
            

            // Camera Box Constraints (Touch left and right edges of the phone)
            cameraBox.topAnchor.constraint(equalTo: self.topAnchor, constant: 150), // 100 points from the top
            cameraBox.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150), // 100 points from the bottom
            cameraBox.leadingAnchor.constraint(equalTo: self.leadingAnchor), // Touch the left edge
            cameraBox.trailingAnchor.constraint(equalTo: self.trailingAnchor), // Touch the right edge
            
            // Large Circle Constraints
            circle.centerXAnchor.constraint(equalTo: self.centerXAnchor), // Horizontally center the circle
            circle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120), // 150 points from the bottom
            circle.widthAnchor.constraint(equalToConstant: 85), // Width 85
            circle.heightAnchor.constraint(equalToConstant: 85), // Height 85
            
        
        ])

        
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}

*/
