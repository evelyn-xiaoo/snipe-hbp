//
//  FriendCell.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/9/25.
//


//
//  FriendCell.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//
import UIKit

class FriendCell: UITableViewCell {
    var nameLabel: UILabel!
    var usernameLabel: UILabel!
    var profileImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profileImageView = UIImageView()
        profileImageView.backgroundColor = .gray
        profileImageView.layer.cornerRadius = 25
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        usernameLabel = UILabel()
        usernameLabel.font = UIFont.systemFont(ofSize: 14)
        usernameLabel.textColor = .gray
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(usernameLabel)
        
        initConstraints()
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            usernameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}