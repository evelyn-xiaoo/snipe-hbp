//
//  PublicProfileController.swift
//  snipe
//
//  Created by Iris Liu on 2/8/25.
//

import UIKit

class PublicProfileController: UIViewController {
    let publicProfile = PublicProfile()  // PublicProfile instance
    
    override func loadView() {
        view = publicProfile  // Set CameraScreen as the main view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup after loading the view, if needed.
    }
}
