//
//  LoginView.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import UIKit

class LoginView: UIView {
    var createAccountButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        
        setUpButtons()
        
        initConstraints()
    }
    
    func setUpButtons() {
        createAccountButton = UIButton(type: .system)
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(.blue, for: .normal)
        
        //VERY IMPORTANT
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(createAccountButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            createAccountButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            createAccountButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
