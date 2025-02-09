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
    
    // Required initializer (for storyboards, nib files, etc.)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
