//
//  CameraScreenController.swift
//  snipe
//
//  Created by Iris Liu on 2/8/25.
//

import UIKit

class CameraScreenController: UIViewController {
    let cameraScreen = CameraScreen()  // CameraScreen instance
    
    override func loadView() {
        view = cameraScreen  // Set CameraScreen as the main view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraScreen.groupButton.addTarget(self, action: #selector(groupButtonTapped), for: .touchUpInside)
        cameraScreen.personCircleButton.addTarget(self, action: #selector(personCircleTapped), for: .touchUpInside)
    }
    
    @objc func groupButtonTapped() {
        print("group button pressed")
        let groupViewController = GroupsViewController()
        groupViewController.modalPresentationStyle = .fullScreen
        self.present(groupViewController, animated: true)
    }
    
    @objc func personCircleTapped() {
        print("person circle pressed")
        let profileViewController = PublicProfileController()
        profileViewController.modalPresentationStyle = .fullScreen
        self.present(profileViewController, animated: true)
    }
}
