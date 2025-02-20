//
//  GroupsView.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/9/25.
//


//
//  GroupsView.swift
//  snipe
//
//  Created by Madison Weiss on 2/9/25.
//

import UIKit

class GroupsView: UIView {
    var backButton: UIButton!
    var titleLabel: UILabel!
    var addFriendsButton: UIButton!
    var topStackView: UIStackView!
    var noGroupsLabel: UILabel!
    var collectionView: UICollectionView!
    var addButton: UIButton!
    var imageViews: [UIView] = []
    var groups: [String] = []
    
    // Initializes GroupsView
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpButtons()
        setUpLabels()
        setUpCollection()
        initConstraints()
    }
    
    // To set up 'back' button and 'add friends' button
    func setUpButtons() {
        backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = UIColor(red: 0.57, green: 0.06, blue: 0.06, alpha: 1)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backButton)
        
        addFriendsButton = UIButton(type: .system)
        addFriendsButton.setImage(UIImage(systemName: "person.fill.badge.plus"), for: .normal)
        addFriendsButton.tintColor = UIColor(red: 0.57, green: 0.06, blue: 0.06, alpha: 1)
        addFriendsButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addFriendsButton)
        
        addButton = UIButton(type: .system)
        addButton.setTitle("+", for: .normal)
        addButton.tintColor = UIColor(red: 0.57, green: 0.06, blue: 0.06, alpha: 1)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addButton)
    }
    
    // To set up title label and 'no groups yet' label
    func setUpLabels() {
        titleLabel = UILabel()
        titleLabel.text = "YOUR GROUPS"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel.textColor = UIColor(red: 0.57, green: 0.06, blue: 0.06, alpha: 1)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        noGroupsLabel = UILabel()
        noGroupsLabel.text = "No groups yet,\n click + to create one"
        noGroupsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        noGroupsLabel.translatesAutoresizingMaskIntoConstraints = false
        //self.addSubview(noGroupsLabel)
    }
    
    // To set up groups collection
    func setUpCollection() {
        let placeholderViews = [UIView(), UIView(), UIView(), UIView()]  // 4 placeholders for images
        for (index, placeholderView) in placeholderViews.enumerated() {
            placeholderView.backgroundColor = .gray  // Set background color as placeholder
            placeholderView.translatesAutoresizingMaskIntoConstraints = false
            placeholderView.isUserInteractionEnabled = true
            imageViews.append(placeholderView)
            addSubview(placeholderView)
        }
    }
          
    // To initialize constraints for labels and buttons
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Back Button
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 30),
                        
            // Title Label
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                        
            // Add Friends Button
            addFriendsButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            addFriendsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            addFriendsButton.heightAnchor.constraint(equalToConstant: 30),
            
            // Add Button
            addButton.topAnchor.constraint(equalTo: addFriendsButton.bottomAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 30),
                        
            // No Groups Label
//            noGroupsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            noGroupsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
            
            // Placeholder 1
            imageViews[0].topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 50),
            imageViews[0].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            imageViews[0].widthAnchor.constraint(equalToConstant: 150),
            imageViews[0].heightAnchor.constraint(equalToConstant: 150),

            // Placeholder 2
            imageViews[1].topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 50),
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
            imageViews[3].heightAnchor.constraint(equalToConstant: 150),
            
        ])
    }
    
    // Required initializer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}