//
//  CameraFire.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import FirebaseAuth
import UIKit

extension ViewController {
    func logoutCurrentAccount() {
        do {
            try Auth.auth().signOut()
            let loginVC = LoginViewController()
            let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            sceneDelegate?.window?.rootViewController = loginVC

        } catch {
            self.showErrorAlert(message: "Failed to logout.")
        }
    }
}
