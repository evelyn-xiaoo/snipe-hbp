//
//  CreateGroupController.swift
//  snipe
//
//  Created by Iris Liu on 2/9/25.
//

import UIKit

class CreateGroupController: UIViewController {
    let createGroup = CreateGroup()  // PublicProfile instance
    
    override func loadView() {
        view = createGroup  // Set CameraScreen as the main view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup after loading the view, if needed.
    }
}
