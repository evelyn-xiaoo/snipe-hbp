//
//  LeaderboardViewController.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//

import UIKit

class LeaderboardViewController: UIViewController {
    let leaderboardView = LeaderboardView()

    override func loadView() {
        view = leaderboardView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboardView.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }

    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
