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
        // Additional setup after loading the view, if needed.
    }
}
