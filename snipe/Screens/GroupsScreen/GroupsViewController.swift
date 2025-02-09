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
    }
}
