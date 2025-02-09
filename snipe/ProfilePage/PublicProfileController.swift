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
        
        publicProfile.backArrowButton.addTarget(self, action: #selector(backArrowTapped), for: .touchUpInside)
    }
    
    @objc func backArrowTapped() {
        print("back arrow tapped")
        let cameraScreenViewController = CameraScreenController()
        cameraScreenViewController.modalPresentationStyle = .fullScreen
        self.present(cameraScreenViewController, animated: true)
    }
}
