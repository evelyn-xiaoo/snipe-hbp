//
//  VoteViewController.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//

import UIKit

class VoteViewController: UIViewController {
    
    let voteView = VoteView()
    
    override func loadView() {
        view = voteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Optionally, set the title for the view controller
        self.title = "Vote for Your Favorite"
        
        // Set up the data source and delegate for the table view
        voteView.tableView.dataSource = self
        voteView.tableView.delegate = self
        
        // Remove the separator line
        voteView.tableView.separatorStyle = .singleLine
    }
}

// Extension to handle UITableView data source and delegate methods
extension VoteViewController: UITableViewDataSource, UITableViewDelegate {
    
    // TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voteView.players.count // Access players from voteView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = voteView.players[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableConfigs.votingTableName, for: indexPath) as? PlayerCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(assassinName: player.assassinName, targetName: player.targetName)
        
        return cell
    }
    
    // Handle row selection (optional)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? PlayerCell {
            print("PlayerCell tapped: \(cell.assassinTargetLabel.text ?? "")")
        }
    }
}
