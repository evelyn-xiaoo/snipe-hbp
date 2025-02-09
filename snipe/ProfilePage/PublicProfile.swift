import UIKit

class PublicProfile: UIView {
    
    let nameLabel: UILabel
    let usernameLabel: UILabel
    let bioLabel: UILabel
    let publicButton: UIButton  // Button for "PUBLIC"
    let privateButton: UIButton  // Button for "PRIVATE"
    let circle: UIView
    let backArrowButton: UIButton  // Button for arrow.backward
    let pencilButton: UIButton  // Button for pencil
    var imageViews: [UIView] = []  // To hold the placeholder views

    override init(frame: CGRect) {
        nameLabel = UILabel()
        usernameLabel = UILabel()
        bioLabel = UILabel()
        publicButton = UIButton(type: .system)
        privateButton = UIButton(type: .system)
        circle = UIView()
        backArrowButton = UIButton(type: .system)
        pencilButton = UIButton(type: .system)

        super.init(frame: frame)
        self.backgroundColor = .white

        setupViews()
    }

    required init?(coder: NSCoder) {
        nameLabel = UILabel()
        usernameLabel = UILabel()
        bioLabel = UILabel()
        publicButton = UIButton(type: .system)
        privateButton = UIButton(type: .system)
        circle = UIView()
        backArrowButton = UIButton(type: .system)
        pencilButton = UIButton(type: .system)

        super.init(coder: coder)

        setupViews()
    }

    private func setupViews() {
        let darkBackground = UIView()
        darkBackground.translatesAutoresizingMaskIntoConstraints = false
        darkBackground.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        darkBackground.layer.cornerRadius = 15
        addSubview(darkBackground)

        nameLabel.text = "FIRST LAST"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)

        usernameLabel.text = "@usernamehere"
        usernameLabel.font = UIFont.systemFont(ofSize: 12)
        usernameLabel.textColor = .white
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(usernameLabel)

        bioLabel.text = "bio here. idk what to say"
        bioLabel.font = UIFont.systemFont(ofSize: 12)
        bioLabel.textColor = .white
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.numberOfLines = 0
        addSubview(bioLabel)

        // Button setup for "PUBLIC"
        publicButton.setTitle("PUBLIC", for: .normal)
        publicButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        publicButton.setTitleColor(UIColor(red: 146/255, green: 16/255, blue: 16/255, alpha: 1), for: .normal)
        publicButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(publicButton)

        // Button setup for "PRIVATE"
        privateButton.setTitle("PRIVATE", for: .normal)
        privateButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        privateButton.setTitleColor(.black, for: .normal)
        privateButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(privateButton)

        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 42.5
        addSubview(circle)

        // Button setup for arrow.backward SF Symbol (Left Side)
        let arrowImage = UIImage(systemName: "arrow.backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        backArrowButton.setImage(arrowImage, for: .normal)
        backArrowButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backArrowButton)

        // Button setup for pencil SF Symbol (Right Side)
        let pencilImage = UIImage(systemName: "pencil")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        pencilButton.setImage(pencilImage, for: .normal)
        pencilButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pencilButton)

        // Create placeholder views (4 placeholders for now)
        let placeholderViews = [UIView(), UIView(), UIView(), UIView()]  // 4 placeholders for images
        for (index, placeholderView) in placeholderViews.enumerated() {
            placeholderView.backgroundColor = .gray  // Set background color as placeholder
            placeholderView.translatesAutoresizingMaskIntoConstraints = false
            placeholderView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            placeholderView.addGestureRecognizer(tapGesture)
            imageViews.append(placeholderView)
            addSubview(placeholderView)
        }

        // Set the constraints for each placeholder
        NSLayoutConstraint.activate([
            // Placeholder 1
            imageViews[0].topAnchor.constraint(equalTo: publicButton.bottomAnchor, constant: 50),
            imageViews[0].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            imageViews[0].widthAnchor.constraint(equalToConstant: 150),
            imageViews[0].heightAnchor.constraint(equalToConstant: 150),

            // Placeholder 2
            imageViews[1].topAnchor.constraint(equalTo: publicButton.bottomAnchor, constant: 50),
            imageViews[1].leadingAnchor.constraint(equalTo: imageViews[0].trailingAnchor, constant: 20),
            imageViews[1].widthAnchor.constraint(equalToConstant: 150),
            imageViews[1].heightAnchor.constraint(equalToConstant: 150),

            // Placeholder 3
            imageViews[2].topAnchor.constraint(equalTo: imageViews[0].bottomAnchor, constant: 20),
            imageViews[2].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            imageViews[2].widthAnchor.constraint(equalToConstant: 150),
            imageViews[2].heightAnchor.constraint(equalToConstant: 150),

            // Placeholder 4
            imageViews[3].topAnchor.constraint(equalTo: imageViews[1].bottomAnchor, constant: 20),
            imageViews[3].leadingAnchor.constraint(equalTo: imageViews[2].trailingAnchor, constant: 20),
            imageViews[3].widthAnchor.constraint(equalToConstant: 150),
            imageViews[3].heightAnchor.constraint(equalToConstant: 150)
        ])
        
        // Auto Layout Constraints for other views
        NSLayoutConstraint.activate([
            darkBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            darkBackground.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 260), // Moved up 20
            darkBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            darkBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            circle.widthAnchor.constraint(equalToConstant: 85),
            circle.heightAnchor.constraint(equalToConstant: 85),
            circle.topAnchor.constraint(equalTo: self.topAnchor, constant: 115), // Moved up 20
            circle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),

            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 130), // Moved up 20

            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),

            bioLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            bioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 30),
            bioLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            // Arrow Backward Button Constraints (Moved up 20)
            backArrowButton.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -40),  // 50 points above nameLabel
            backArrowButton.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -65), // Moved left

            // Pencil Button Constraints (Moved up 20)
            pencilButton.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -40),  // 50 points above nameLabel
            pencilButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 80), // Moved right

            // Public Button Constraints
            publicButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            publicButton.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 50),

            // Private Button Constraints
            privateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            privateButton.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 50)
        ])
    }

    @objc func imageTapped(sender: UITapGestureRecognizer) {
        // This is where the action for the image click goes
        print("Placeholder tapped!")
        // Implement navigation or any other action
    }
}
