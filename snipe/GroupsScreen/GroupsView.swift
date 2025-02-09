//
//  GroupsView.swift
//  snipe
//
//  Created by Aaron Ashby on 2/9/25.
//

import UIKit

class GroupsView: UIView {
    var backButton: UIButton!
    var titleLabel: UILabel!
    var addFriendsButton: UIButton!
    var topStackView: UIStackView!
    var noGroupsLabel: UILabel!
    var collectionView: UICollectionView!
    
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
        self.addSubview(noGroupsLabel)
    }
    
    // To set up groups collection
    func setUpCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 175, height: 234)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(GroupsCollectionViewCell.self, forCellWithReuseIdentifier: "groupCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collectionView)
    }
          
    // To initialize constraints for labels and buttons
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Back button constraints
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            // Title label constraints (centered between buttons)
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Add Friends button constraints
            addFriendsButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            addFriendsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            addFriendsButton.heightAnchor.constraint(equalToConstant: 30),
            
            // Add 'no groups' label constraints
            noGroupsLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            noGroupsLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            // Add collection constraints
            collectionView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    // Required initializer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
