//
//  PersonViewController.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/9/25.
//

import UIKit
import FirebaseFirestore

class PersonViewController: UIViewController {
    let personView = PersonView()
    
    var picture: UIImage?
    var selectedUser: FirestoreUser?
    
    let database = Firestore.firestore()
    var appUsers = [FirestoreUser]()
    var tableViewUsers = [FirestoreUser]()
    
    var textFieldBottomConstraint: NSLayoutConstraint!
    
    override func loadView() {
        view = personView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup actions for buttons
        personView.exitButton.addTarget(self, action: #selector(confirmExit), for: .touchUpInside)
        personView.nextButton.addTarget(self, action: #selector(selectGroup), for: .touchUpInside)
        
        personView.tableView.delegate = self
        personView.tableView.dataSource = self
        personView.searchBar.delegate = self
        
        
        getAllUsers()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        personView.usernameLabel.text = personView.searchBar.text
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        personView.polaroidImageView.image = picture
    }
    
    @objc func confirmExit() {
        let alert = UIAlertController(title: "Are you sure?", message: "Are you sure you want to exit and delete the picture?", preferredStyle: .alert)
        
        // Cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Confirm exit and delete
        alert.addAction(UIAlertAction(title: "Yes, Exit", style: .destructive, handler: { [weak self] _ in
            self?.exit()
        }))
        
        present(alert, animated: true)
    }
    
    func exit() {

        self.dismiss(animated: true)
    }
        
    @objc func selectGroup() {
        let groupViewController = GroupViewController()
        groupViewController.modalPresentationStyle = .fullScreen
        groupViewController.picture = picture
        self.present(groupViewController, animated: true)
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

extension PersonViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TableConfigs.allUsers, for: indexPath) as! PersonTableViewCell
        
        cell.labelTitle.text = tableViewUsers[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected: FirestoreUser = tableViewUsers[indexPath.row]
        selectedUser = selected
        
    }
}

//MARK: adopting the search bar protocol...
extension PersonViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            self.tableViewUsers = appUsers
        }else{
            self.tableViewUsers.removeAll()

            for user in appUsers{
                if user.name.contains(searchText){
                    self.tableViewUsers.append(user)
                }
            }
        }
        self.personView.tableView.reloadData()
    }
}
