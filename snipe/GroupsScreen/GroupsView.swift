//
//  GroupsView.swift
//  snipe
//
//  Created by Aaron Ashby on 2/8/25.
//

import UIKit

class GroupsView: UIView {
    var backButton = UIButton()
    var addFriendsButton = UIButton()
    var addGroupButton = UIButton()
    
    var yourGroupsLabel = UILabel()
    
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
        backButton.tintColor = UIColor(hex: "921010")
        
        addFriendsButton = UIButton(type: .system)
        addFriendsButton.setImage(UIImage(systemName: "person.fill.badge.plus"), for: .normal)
        addFriendsButton.tintColor = UIColor(hex: "921010")
        
        addGroupButton = UIButton(type: .system)
        addGroupButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addGroupButton.tintColor = .white
        addGroupButton.backgroundColor = UIColor(hex: "921010")
        addGroupButton.layer.cornerRadius = 30
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        addFriendsButton.translatesAutoresizingMaskIntoConstraints = false
        addGroupButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backButton)
        self.addSubview(addFriendsButton)
        self.addSubview(addGroupButton)
    }
    
    func setUpLabels() {
        yourGroupsLabel.text = "YOUR GROUPS"
        yourGroupsLabel.textColor = UIColor(hex: "921010")
        yourGroupsLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        yourGroupsLabel.layer.shadowColor = UIColor.black.cgColor
        yourGroupsLabel.layer.shadowOpacity = 0.4
        yourGroupsLabel.layer.shadowOffset = CGSize(width: 0, height: 3)
        yourGroupsLabel.layer.shadowRadius = 4
        
        yourGroupsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(yourGroupsLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            backButton.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            
            addFriendsButton.centerXAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            addFriendsButton.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            
            addGroupButton.widthAnchor.constraint(equalToConstant: 60),
            addGroupButton.heightAnchor.constraint(equalToConstant: 60),
            addGroupButton.centerXAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            addGroupButton.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: -90),
            
            yourGroupsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            yourGroupsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
