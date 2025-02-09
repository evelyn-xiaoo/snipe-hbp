//
//  ViewController.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    let cameraView = CameraView()
    
    let firebaseAuth = Auth.auth()
    
    var currentUser: FirestoreUser? = nil
    
    override func loadView() {
        view = cameraView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cameraView.logOutButton.addTarget(self, action: #selector(onLogoutIconClick), for: .touchUpInside)
        
    }
    
    @objc func onLogoutIconClick(){
        logoutCurrentAccount()
    }
    
    func showErrorAlert(message: String){
            let alert = UIAlertController(title: "Error", message: "\(message) Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
