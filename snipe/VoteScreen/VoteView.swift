//
//  VoteView.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//

import UIKit

class VoteView: UIView {
    
    var tableView: UITableView!
    var titleLabel: UILabel!
    var exitButton: UIButton!
    var continueButton: UIButton!  // Add continue button
    
    // Example list of players (Assassin and Target names)
    var players: [(assassinName: String, targetName: String)] = [
        ("@riko", "@target1"),
        ("@player2", "@target2"),
        ("@player3", "@target3"),
        ("@player4", "@target4"),
        ("@player5", "@target5"),
        ("@player6", "@target6"),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white // White background for the main view
        setupTitleLabel()
        setupExitButton()
        setupTableView()
        setupContinueButton()  // Setup the continue button
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup Title Label
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Select Your Favorite"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }
    
    // Setup Exit Button with Custom Icon
    func setupExitButton() {
        exitButton = UIButton(type: .system)
        
        // Set your custom exit icon from Assets
        exitButton.setImage(UIImage(named: "exit"), for: .normal)  // Replace "exitIcon" with your actual image name
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        self.addSubview(exitButton)
    }
    
    // Setup Table View
    func setupTableView() {
        tableView = UITableView()
        tableView.register(PlayerCell.self, forCellReuseIdentifier: TableConfigs.votingTableName)  // Corrected registration
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        self.addSubview(tableView)
    }
    
    // Setup Continue Button with rounded corners and navigation
    func setupContinueButton() {
        continueButton = UIButton(type: .system)
        continueButton.setTitle("Continue", for: .normal)
        
        // Set the background color to light gray
        continueButton.backgroundColor = UIColor(white: 0.9, alpha: 1)  // Light gray background
        
        // Set the title color to black
        continueButton.setTitleColor(.black, for: .normal)
        
        // Adjust the font size and weight
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        // Round the corners for the pill-like shape
        continueButton.layer.cornerRadius = 25  // Rounded corners
        continueButton.layer.masksToBounds = true  // Ensure the content stays inside rounded corners
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        
        self.addSubview(continueButton)
    }
    
    // Constraints setup
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Exit Button
            exitButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            exitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            exitButton.widthAnchor.constraint(equalToConstant: 60),
            exitButton.heightAnchor.constraint(equalToConstant: 60),
            
            // Table View
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20), // Ensures table takes the available space
            
            // Continue Button
            continueButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            continueButton.widthAnchor.constraint(equalToConstant: 200),  // Set desired width
            continueButton.heightAnchor.constraint(equalToConstant: 50),  // Set desired height
        ])
    }

    // Exit Button Action
    @objc func exitButtonTapped() {
        let alert = UIAlertController(title: "Are you sure you want to quit?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Quit", style: .destructive, handler: { _ in
            print("User chose to quit")
        }))
        if let viewController = self.closestViewController() {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    // Continue Button Action to navigate to the next page
    @objc func continueButtonTapped() {
        // Print a message to the console when the button is clicked
        print("Continue button clicked")
        
        // Assuming you have a view controller to push to, replace with actual controller
        if let viewController = self.closestViewController() {
            let nextViewController = SelectionViewController() // Replace with your actual view controller
            viewController.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

// Helper to find the closest view controller
extension UIView {
    func closestViewController() -> UIViewController? {
        var nextResponder: UIResponder? = self
        while nextResponder != nil {
            nextResponder = nextResponder?.next
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
