//
//  GroupsViewController.swift
//  snipe
//
//  Created by Aaron Ashby on 2/8/25.
//

import UIKit

class GroupsViewController: UIViewController {
    let items = ["a", "b", "c", "d"]
    let groupsView = GroupsView()
    
    override func loadView() {
        view = groupsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsView.collectionView.delegate = self
        groupsView.collectionView.dataSource = self
        groupsView.collectionView.reloadData()
        
        updateUI()
    }
    
    // To handle conditional rendering of the 'no groups' label and collection view
    func updateUI() {
        let hasPictures = !items.isEmpty
        groupsView.noGroupsLabel.isHidden = hasPictures
        groupsView.collectionView.isHidden = !hasPictures
    }
}

extension GroupsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // Returns the amount of items to render in this collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    // Renders cells to the UI
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = groupsView.collectionView.dequeueReusableCell(withReuseIdentifier: "groupCell", for: indexPath) as! GroupsCollectionViewCell
        cell.groupNameLabel.text = items[indexPath.item]
        cell.backgroundColor = .lightGray
        return cell
    }
}
