import UIKit

class CameraScreen: UIView {

    let label: UILabel
    let leftImageView: UIImageView
    let rightImageView: UIImageView
    let groupButton: UIButton // Button for the person.2 symbol
    let personCircleButton: UIButton // Button for the person.circle symbol

    // Initializer for CameraScreen
    override init(frame: CGRect) {
        label = UILabel()
        leftImageView = UIImageView()
        rightImageView = UIImageView()
        groupButton = UIButton(type: .system) // Initialize the person button
        personCircleButton = UIButton(type: .system) // Initialize the person.circle button
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupViews()  // Set up label and image views
    }
    
    // Required initializer (for storyboards, nib files, etc.)
    required init?(coder: NSCoder) {
        label = UILabel()
        leftImageView = UIImageView()
        rightImageView = UIImageView()
        groupButton = UIButton(type: .system) // Initialize the person button
        personCircleButton = UIButton(type: .system) // Initialize the person.circle button
        super.init(coder: coder)

        setupViews()  // Set up label and image views
    }
    
    // Function to setup the label and image views
    private func setupViews() {
        // Define the custom color (#921010)
        let customRedColor = UIColor(hex: "#921010")
        
        // Label setup
        label.text = "snipe"
        label.font = UIFont.systemFont(ofSize: 48)
        label.textColor = customRedColor // Set the text color to custom red
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        /*  // Button setup for person.2 SF Symbol (Left Side)
         let personImage = UIImage(systemName: "person.2")?.withTintColor(.black, renderingMode: .alwaysOriginal) // Use person.2 symbol and set it to black
         personButton.setImage(personImage, for: .normal) // Set the image for normal state
         personButton.translatesAutoresizingMaskIntoConstraints = false
         addSubview(personButton)
         
         // Button setup for person.circle SF Symbol (Right Side)
         let personCircleImage = UIImage(systemName: "person.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal) // Use person.circle symbol and set it to black
         personCircleButton.setImage(personCircleImage, for: .normal) // Set the image for normal state
         personCircleButton.translatesAutoresizingMaskIntoConstraints = false
         addSubview(personCircleButton)
         */
        
        
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
        
        
        // Image Views setup
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add image views to the view
        addSubview(leftImageView)
        addSubview(rightImageView)
        
        /*
         // Set images for the image views (Replace with your actual image files)
         leftImageView.image = UIImage(contentsOfFile: "Groups")  // Replace with actual left image file name
         rightImageView.image = UIImage(contentsOfFile: "Profile") // Replace with actual right image file name
         */
        
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
        
        
        /*
         // Smaller black circles setup
         let smallCircle1 = UIView()
         let smallCircle2 = UIView()
         let smallCircle3 = UIView()
         
         // Set properties for all three smaller circles
         [smallCircle1, smallCircle2, smallCircle3].forEach { smallCircle in
         smallCircle.translatesAutoresizingMaskIntoConstraints = false
         smallCircle.backgroundColor = .black // Set the color to black
         smallCircle.layer.cornerRadius = 15 // Half of 30 to make it a perfect circle
         addSubview(smallCircle)
         }
         
         */
        
        // Setting up Auto Layout constraints for Camera Box, Large Circle, Smaller Circles, and Buttons
        NSLayoutConstraint.activate([
            // Label Constraints
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor), // Horizontally center the label
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 65), // Position 50 points from the top
            
            // Person Button (person.2) Constraints (Position 50 left of the "snipe" label)
            groupButton.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -50), // 50 points left of the label
            groupButton.widthAnchor.constraint(equalToConstant: 50),
            groupButton.heightAnchor.constraint(equalTo: groupButton.widthAnchor),
            groupButton.centerYAnchor.constraint(equalTo: label.centerYAnchor), // Vertically center with the label
            
            // Person Circle Button (person.circle) Constraints (Position 50 right of the "snipe" label)
            personCircleButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 50), // 50 points right of the label
            personCircleButton.widthAnchor.constraint(equalToConstant: 50),
            personCircleButton.heightAnchor.constraint(equalTo: personCircleButton.widthAnchor),
            personCircleButton.centerYAnchor.constraint(equalTo: label.centerYAnchor), // Vertically center with the label
            
            // Left Image Constraints
            leftImageView.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -20), // 20 points left of the label
            leftImageView.centerYAnchor.constraint(equalTo: label.centerYAnchor), // Vertically center with the label
            
            // Right Image Constraints
            rightImageView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20), // 20 points right of the label
            rightImageView.centerYAnchor.constraint(equalTo: label.centerYAnchor), // Vertically center with the label
            
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
            
            /*
             // Smaller Circles Constraints (Positioned Around the Top Half of the Large Circle)
             smallCircle1.centerXAnchor.constraint(equalTo: circle.centerXAnchor, constant: -30), // Left circle
             smallCircle1.centerYAnchor.constraint(equalTo: circle.centerYAnchor, constant: -30), // Above center
             
             smallCircle2.centerXAnchor.constraint(equalTo: circle.centerXAnchor), // Center circle
             smallCircle2.centerYAnchor.constraint(equalTo: circle.centerYAnchor, constant: -30), // Above center
             
             smallCircle3.centerXAnchor.constraint(equalTo: circle.centerXAnchor, constant: 30), // Right circle
             smallCircle3.centerYAnchor.constraint(equalTo: circle.centerYAnchor, constant: -30), // Above center
             
             */
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
