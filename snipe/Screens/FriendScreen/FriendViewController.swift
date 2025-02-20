//
//  FriendViewController.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/9/25.
//


//
//  FriendViewController.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//

import UIKit

class FriendViewController: UIViewController, UITableViewDataSource {
    let friendView = FriendView()

    override func loadView() {
        view = friendView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        friendView.friendsTableView.dataSource = self
    }

    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendView.friendsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        let friend = friendView.friendsData[indexPath.row]

        cell.nameLabel.text = "\(friend.0) \(friend.1)"
        cell.usernameLabel.text = friend.2
        return cell
    }

    // MARK: - Table View Customization

    // Set custom row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100  // Increase the height to add more space between cells
    }
}