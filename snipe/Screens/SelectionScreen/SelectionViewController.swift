//
//  SelectionViewController.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//

import UIKit

class SelectionViewController: UIViewController {
    let selectionView = SelectionView()
    
    override func loadView() {
        view = selectionView
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply constraints
        selectionView.initConstraints()
        
        // Button Actions
        selectionView.submitButton.addTarget(self, action: #selector(submitSelectedItem), for: .touchUpInside)
        selectionView.backwardButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        selectionView.exitButton.addTarget(self, action: #selector(confirmExit), for: .touchUpInside)
    }
    
    // Handle Submit Action
    @objc func submitSelectedItem() {
        print("Selected item has been submitted!")
    }
    
    // Handle Backward Button Action
    @objc func goBack() {
        // Pop the view controller or navigate back
        self.navigationController?.popViewController(animated: true)
    }
    
    // Handle Exit Button Action (Alert Confirmation)
    @objc func confirmExit() {
        let alertController = UIAlertController(title: "Are you sure you want to exit now?",
                                                message: nil,
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Exit", style: .destructive, handler: { _ in
            // Handle exit logic
            self.navigationController?.popViewController(animated: true)
        }))
        
        present(alertController, animated: true, completion: nil)
    }
}
