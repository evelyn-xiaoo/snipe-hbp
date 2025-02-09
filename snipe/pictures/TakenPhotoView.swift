//
//  TakenPhotoView.swift
//  snipe
//
//  Created by Vivian Li on 2/8/25.

import UIKit

class TakenPhotoView: UIView, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    var createAccountButton: UIButton!
    var polaroidContainerView: UIView!  // Container for the border and image
    var polaroidImageView: UIImageView!
    var usernameLabel: UILabel!
    var searchBar: UISearchBar!
    var saveButton: UIButton!
    var exitButton: UIButton! // Exit button (replacing trash icon)
    var nextButton: UIButton!
    var tableView: UITableView!
    
    var allItems = ["@riko", "@kazya", "@mikasa"]
    var filteredItems: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUpPolaroidContainerView()
        setUpUsernameLabel()
        setUpSearchBar()
        setUpButtons()
        setUpTableView()
        initConstraints()
        
        // Filter the items initially
        filteredItems = allItems
    }
    
    func setUpPolaroidContainerView() {
        polaroidContainerView = UIView()
        polaroidContainerView.layer.borderColor = UIColor.lightGray.cgColor
        polaroidContainerView.layer.borderWidth = 30
        polaroidContainerView.layer.cornerRadius = 10
        polaroidContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(polaroidContainerView)
        
        polaroidImageView = UIImageView()
        polaroidImageView.contentMode = .scaleAspectFill
        polaroidImageView.clipsToBounds = true
        polaroidImageView.translatesAutoresizingMaskIntoConstraints = false
        polaroidContainerView.addSubview(polaroidImageView)
        
        if let image = UIImage(named: "cartoon") {
            polaroidImageView.image = image
        }
    }
    
    func setUpUsernameLabel() {
        usernameLabel = UILabel()
        usernameLabel.text = "@username"
        usernameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        usernameLabel.textColor = .black
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameLabel)
    }
    
    func setUpSearchBar() {
        searchBar = UISearchBar()
        searchBar.placeholder = "Search for your target"
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(searchBar)
    }
    
    func setUpButtons() {
        saveButton = UIButton(type: .system)
        if let saveImage = UIImage(named: "save") {
            saveButton.setImage(saveImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(saveButton)
        
        // Exit button (replacing trash icon)
        exitButton = UIButton(type: .system)
        if let exitImage = UIImage(named: "exit") {  // Replace with actual exit icon name
            exitButton.setImage(exitImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            print("Exit icon image not found!")
        }
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(exitButton)
        
        nextButton = UIButton(type: .system)
        nextButton.setTitle("next", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "LondrinaShadowRegular", size: 40)
        nextButton.setTitleColor(.red, for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nextButton)
    }
    
    func setUpTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Polaroid Container View
            polaroidContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            polaroidContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            polaroidContainerView.widthAnchor.constraint(equalToConstant: 300),
            polaroidContainerView.heightAnchor.constraint(equalToConstant: 350),
            
            // Polaroid Image View
            polaroidImageView.topAnchor.constraint(equalTo: polaroidContainerView.topAnchor),
            polaroidImageView.leadingAnchor.constraint(equalTo: polaroidContainerView.leadingAnchor),
            polaroidImageView.trailingAnchor.constraint(equalTo: polaroidContainerView.trailingAnchor),
            polaroidImageView.bottomAnchor.constraint(equalTo: polaroidContainerView.bottomAnchor),
            
            // Username label below the polaroid container
            usernameLabel.topAnchor.constraint(equalTo: polaroidContainerView.bottomAnchor, constant: -27),
            usernameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Search Bar
            searchBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchBar.topAnchor.constraint(equalTo: polaroidContainerView.bottomAnchor, constant: 10),
            searchBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            
            // Save Button
            saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 320),
            saveButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            saveButton.widthAnchor.constraint(equalToConstant: 30), // Match exit button size
            saveButton.heightAnchor.constraint(equalToConstant: 30),

            // Exit Button (top left)
            exitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            exitButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            exitButton.widthAnchor.constraint(equalToConstant: 60),
            exitButton.heightAnchor.constraint(equalToConstant: 60),
            
            // Next Button
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        self.bringSubviewToFront(saveButton)
        self.bringSubviewToFront(exitButton)
        self.bringSubviewToFront(nextButton)
    }
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = filteredItems[indexPath.row]
        return cell
    }
    
    // Handle search query updates
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredItems = allItems.filter { item in
            return item.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    // Handle selection of a username from the search results
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        usernameLabel.text = filteredItems[indexPath.row]
        searchBar.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
