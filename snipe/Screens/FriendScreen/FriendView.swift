//
//  FriendView.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/9/25.
//


//
//  FriendView.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//

import UIKit

class FriendView: UIView {
    var backButton: UIButton!
    var searchButton: UIButton!
    var friendsTableView: UITableView!
    var titleLabel: UILabel!
    
    // Mock data for friends
    var friendsData = [
        ("John", "Doe", "@johndoe"),
        ("Jane", "Smith", "@janesmith"),
        ("Emily", "Johnson", "@emilyjohnson"),
        ("Michael", "Brown", "@michaelbrown"),
        ("Sarah", "Williams", "@sarahwilliams")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        
        setUpButtons()
        setUpTitleLabel()
        setUpTableView()
        initConstraints()
    }
    
    func setUpButtons() {
        backButton = UIButton(type: .system)
        
        // Check if image exists before setting it to avoid crashes
        if let backImage = UIImage(named: "backward") {
            backButton.setImage(backImage, for: .normal)
        } else {
            print("Warning: 'backward' image not found in assets")
        }
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        searchButton = UIButton(type: .system)
        
        if let searchImage = UIImage(named: "search") {
            searchButton.setImage(searchImage, for: .normal)
        } else {
            print("Warning: 'search' image not found in assets")
        }
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(searchButton)
    }
    
    func setUpTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Friends"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .systemBlue
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }
    
    func setUpTableView() {
        friendsTableView = UITableView()
        friendsTableView.translatesAutoresizingMaskIntoConstraints = false
        friendsTableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
        friendsTableView.separatorStyle = .singleLine
        friendsTableView.separatorInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        friendsTableView.backgroundColor = .white  // Set background color for the table view
        friendsTableView.showsVerticalScrollIndicator = false  // Hide vertical scroll indicator for a cleaner look
        friendsTableView.allowsSelection = false  // Optionally disable selection if not needed
        
        self.addSubview(friendsTableView)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Backward Button (Top Left)
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Search Button (Top Right)
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            searchButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
    
            // Table View Position (Further down)
            friendsTableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            friendsTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            friendsTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            friendsTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}