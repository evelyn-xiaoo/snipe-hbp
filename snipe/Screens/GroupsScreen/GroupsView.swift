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
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpButtons()
        setUpLabels()
        initConstraints()
    }
    
    
    func setUpButtons() {
        backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backButton)
        
        addFriendsButton = UIButton(type: .system)
        addFriendsButton.setTitle("Add Friends", for: .normal)
        addFriendsButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        addFriendsButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addFriendsButton)
    }
    
    func setUpLabels() {
        titleLabel = UILabel()
        titleLabel.text = "Groups"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }
    
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
            addFriendsButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
