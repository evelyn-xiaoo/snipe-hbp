//
//  GroupsCollectionViewCell.swift
//  snipe
//
//  Created by Aaron Ashby on 2/8/25.
//

import UIKit

class GroupsCollectionViewCell: UICollectionViewCell {
    var groupNameLabel: UILabel!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        groupNameLabel = UILabel()
        contentView.addSubview(groupNameLabel)
        
        groupNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            groupNameLabel.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            groupNameLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor, constant: 130)
        ])
        contentView.backgroundColor = .lightGray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
