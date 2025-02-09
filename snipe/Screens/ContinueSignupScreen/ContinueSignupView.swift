//
//  ContinueSignupView.swift
//  snipe
//
//  Created by Madison Weiss on 2/8/25.
//

import UIKit

class ContinueSignupView: UIView {
    var profileImage: UIButton!
    var name: UITextField!
    var username: UITextField!
    var bio: UITextField!
    var continueButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        
        setupimagePFP()
        setUpTextFields()
        setUpButtons()
        initConstraints()
    }
    
    func setupimagePFP(){
        profileImage = UIButton(type: .system)
        profileImage.setTitle("", for: .normal)
        profileImage.setImage(UIImage(systemName: "person.circle"), for: .normal)
        profileImage.tintColor = .gray
        profileImage.contentHorizontalAlignment = .fill
        profileImage.contentVerticalAlignment = .fill
        profileImage.imageView?.contentMode = .scaleAspectFill
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.showsMenuAsPrimaryAction = true
        profileImage.layer.cornerRadius = 50
        profileImage.clipsToBounds = true
        self.addSubview(profileImage)
    }
    
    func setUpTextFields() {
        name = UITextField()
        name.placeholder = "name"
        name.backgroundColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
        
        username = UITextField()
        username.placeholder = "username"
        username.backgroundColor = .white
        username.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(username)
        
        bio = UITextField()
        bio.placeholder = "bio"
        bio.backgroundColor = .white
        bio.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bio)
    }
    
    func setUpButtons() {
        continueButton = UIButton(type: .system)
        continueButton.setTitle("continue", for: .normal)
        continueButton.setTitleColor(.blue, for: .normal)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(continueButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 125),
            profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor),
            
            name.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 100),
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            name.widthAnchor.constraint(equalToConstant: 200),
            name.heightAnchor.constraint(equalToConstant: 40),
            
            username.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 100),
            username.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            username.widthAnchor.constraint(equalToConstant: 200),
            username.heightAnchor.constraint(equalToConstant: 40),
            
            bio.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 20),
            bio.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            bio.widthAnchor.constraint(equalToConstant: 200),
            bio.heightAnchor.constraint(equalToConstant: 40),
            
            // Button constraints
            continueButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
