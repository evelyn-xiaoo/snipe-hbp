//
//  GroupsView.swift
//  snipe
//
//  Created by Aaron Ashby on 2/8/25.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


class NoGroupsView: UIView {
    var backButton = UIButton()
    var addFriendsButton = UIButton()
    var addGroupButton = UIButton()
    
    var yourGroupsLabel = UILabel()
    var noGroupsYetLabel = UILabel()
    
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
        
        noGroupsYetLabel.text = "No groups yet,\nclick + to create one"
        noGroupsYetLabel.numberOfLines = 0
        noGroupsYetLabel.textAlignment = .center
        noGroupsYetLabel.textColor = .gray
        noGroupsYetLabel.font = UIFont.systemFont(ofSize: 16)
        
        yourGroupsLabel.translatesAutoresizingMaskIntoConstraints = false
        noGroupsYetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(yourGroupsLabel)
        self.addSubview(noGroupsYetLabel)
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
            
            noGroupsYetLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            noGroupsYetLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
