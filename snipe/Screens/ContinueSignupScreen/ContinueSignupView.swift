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

    var nameLine: UIView!
    var userLine: UIView!
    var bioLine: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
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
        
        nameLine = UIView()
        nameLine.backgroundColor = .black
        nameLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLine)
        
        username = UITextField()
        username.placeholder = "username"
        username.backgroundColor = .white
        username.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(username)
        
        userLine = UIView()
        userLine.backgroundColor = .black
        userLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userLine)
        
        bio = UITextField()
        bio.placeholder = "bio"
        bio.backgroundColor = .white
        bio.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bio)
        
        bioLine = UIView()
        bioLine.backgroundColor = .black
        bioLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bioLine)
    }
    
    func setUpButtons() {
        continueButton = UIButton(type: .system)
        continueButton.setTitle("continue", for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "LondrinaShadow-Regular", size: 32) ?? UIFont.systemFont(ofSize: 32)
        continueButton.setTitleColor(UIColor(red: 146/255, green: 16/255, blue: 16/255, alpha: 1.0), for: .normal)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(continueButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            profileImage.bottomAnchor.constraint(equalTo: name.topAnchor, constant: -30),
                profileImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                profileImage.widthAnchor.constraint(equalToConstant: 125),
                profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor),
            
            // TextField constraints
            name.bottomAnchor.constraint(equalTo: nameLine.topAnchor, constant: -5),
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            name.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            
            nameLine.bottomAnchor.constraint(equalTo: username.topAnchor, constant: -10),
            nameLine.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            nameLine.widthAnchor.constraint(equalTo: name.widthAnchor),
            nameLine.heightAnchor.constraint(equalToConstant: 1),
            
            username.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            username.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            username.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            
            userLine.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 5),
            userLine.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            userLine.widthAnchor.constraint(equalTo: name.widthAnchor),
            userLine.heightAnchor.constraint(equalToConstant: 1),
            
            bio.topAnchor.constraint(equalTo: userLine.bottomAnchor, constant: 10),
            bio.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            bio.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            
            bioLine.topAnchor.constraint(equalTo: bio.bottomAnchor, constant: 5),
            bioLine.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            bioLine.widthAnchor.constraint(equalTo: name.widthAnchor),
            bioLine.heightAnchor.constraint(equalToConstant: 1),
            
            // Button constraints
            continueButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            continueButton.topAnchor.constraint(equalTo: bioLine.bottomAnchor, constant: 30)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
