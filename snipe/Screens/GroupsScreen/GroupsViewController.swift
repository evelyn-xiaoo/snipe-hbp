//
//  GroupsViewController.swift
//  snipe
//
//  Created by Madison Weiss on 2/9/25.
//

import UIKit

class GroupsViewController: UIViewController {
    let groupsView = GroupsView()
    
    override func loadView() {
        view = groupsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsView.backButton.addTarget(self, action: #selector(backArrowTapped), for: .touchUpInside)
        groupsView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func backArrowTapped() {
        print("back arrow tapped")
        self.dismiss(animated: true)
    }
    
    @objc func addButtonTapped() {
        let createGroupViewController = CreateGroupController()
        createGroupViewController.modalPresentationStyle = .fullScreen
        self.present(createGroupViewController, animated: true)
    }
}
