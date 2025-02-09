import UIKit

class CreateGroup: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var groupName: UIButton!
    var creatorPicture: UIView!
    var userCreator: UILabel!
    var creatorLabel: UILabel!
    var backButton: UIButton!
    var voting: UILabel!
    let buttonWeek: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    var groupBackArrow: UIButton!
    var weekStackView: UIStackView!
    var selectedButton: UIButton?
    var createGroupButton: UIButton! // Added variable for the Create button
    var friendsTableView: UITableView!
    var friendsData: [(String, String)] = [("John", "@johndoe"), ("Jane", "@janesmith"), ("Emily", "@emilyjohnson"), ("Michael", "@michaelbrown"), ("Sarah", "@sarahwilliams")]
    var selectedFriends: [String] = []
    var instructionLabel: UILabel!  // Instruction label for above the friends list
    var horizontalLine: UIView!  // Horizontal line view
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        let customRedColor = UIColor(red: 146/255, green: 16/255, blue: 16/255, alpha: 1) // #921010
        
        
        // Group Name
        groupName = UIButton(type: .system)
        groupName.setTitle("GROUP NAME", for: .normal)
        groupName.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        groupName.setTitleColor(UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1), for: .normal)
        groupName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(groupName)
        
        // Creator Info
        creatorPicture = UIView()
        creatorPicture.translatesAutoresizingMaskIntoConstraints = false
        creatorPicture.backgroundColor = .gray
        creatorPicture.layer.cornerRadius = 42.5
        addSubview(creatorPicture)
        
        userCreator = UILabel()
        userCreator.text = "@usernamehere"
        userCreator.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        userCreator.textColor = customRedColor
        userCreator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userCreator)
        
        creatorLabel = UILabel()
        creatorLabel.text = "CREATOR"
        creatorLabel.font = UIFont.systemFont(ofSize: 12)
        creatorLabel.textColor = .black
        creatorLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(creatorLabel)
        
        voting = UILabel()
        voting.text = "VOTING DAY"
        voting.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        voting.textColor = customRedColor
        voting.translatesAutoresizingMaskIntoConstraints = false
        addSubview(voting)
        
        // Button setup for arrow.backward SF Symbol (Left Side)
        groupBackArrow = UIButton(type: .system)
        let arrowImage = UIImage(systemName: "arrow.backward")?.withTintColor(customRedColor, renderingMode: .alwaysOriginal) // Updated red color
        groupBackArrow.setImage(arrowImage, for: .normal)
        groupBackArrow.translatesAutoresizingMaskIntoConstraints = false
        addSubview(groupBackArrow)
        
        
        // Set up the stack view for week buttons
        weekStackView = UIStackView()
        weekStackView.axis = .horizontal
        weekStackView.spacing = 10
        weekStackView.alignment = .center
        weekStackView.distribution = .fillEqually
        weekStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(weekStackView)
        
        // Add buttons for each day of the week
        for day in buttonWeek {
            let button = UIButton(type: .system)
            button.setTitle(day, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            button.setTitleColor(UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1), for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            weekStackView.addArrangedSubview(button)
        }
        
        // Create the Create button
        createGroupButton = UIButton(type: .system)
        createGroupButton.setTitle("CREATE", for: .normal)
        createGroupButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        createGroupButton.backgroundColor = customRedColor
        createGroupButton.setTitleColor(.white, for: .normal)
        createGroupButton.layer.cornerRadius = 10
        createGroupButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(createGroupButton)
        
        // Instruction Label for friends list
        instructionLabel = UILabel()
        instructionLabel.text = "Select friends to join"
        instructionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        instructionLabel.textColor = .black
        instructionLabel.textAlignment = .center
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(instructionLabel)
        
        // Create Horizontal Line
        horizontalLine = UIView()
        horizontalLine.backgroundColor = .lightGray
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalLine)
        
        // Friends List Table View
        friendsTableView = UITableView()
        friendsTableView.translatesAutoresizingMaskIntoConstraints = false
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        friendsTableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
        friendsTableView.allowsMultipleSelection = true  // Allow multiple selection
        friendsTableView.separatorStyle = .singleLine
        friendsTableView.separatorInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        friendsTableView.backgroundColor = .white
        addSubview(friendsTableView)
        
        // Constraints
        NSLayoutConstraint.activate([
            groupBackArrow.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            groupBackArrow.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                       
            
            groupName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            groupName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            creatorPicture.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            creatorPicture.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            userCreator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userCreator.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 80),
            
            creatorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            creatorLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            voting.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            voting.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
            
            weekStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            weekStackView.topAnchor.constraint(equalTo: voting.bottomAnchor, constant: 20),
            weekStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            
            createGroupButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            createGroupButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            createGroupButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            createGroupButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Horizontal line above the instruction label
            horizontalLine.topAnchor.constraint(equalTo: weekStackView.bottomAnchor, constant: 20),
            horizontalLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            horizontalLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            horizontalLine.heightAnchor.constraint(equalToConstant: 1),
            
            // Instruction Label above the friends list
            instructionLabel.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 50),
            instructionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Constraints for friends list
            friendsTableView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 30),  // Shift the list down
            friendsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            friendsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120)
        ])
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        sender.setTitleColor(UIColor(red: 146/255, green: 16/255, blue: 16/255, alpha: 1), for: .normal)
        
        if let previouslySelected = selectedButton, previouslySelected != sender {
            previouslySelected.setTitleColor(UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1), for: .normal)
        }
        
        selectedButton = sender
    }
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        let friend = friendsData[indexPath.row]
        cell.nameLabel.text = friend.0
        cell.usernameLabel.text = friend.1
        return cell
    }
    
    // UITableViewDelegate method to handle selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = friendsData[indexPath.row]
        selectedFriends.append(friend.0)  // Add friend to selected list
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let friend = friendsData[indexPath.row]
        if let index = selectedFriends.firstIndex(of: friend.0) {
            selectedFriends.remove(at: index)  // Remove friend from selected list
        }
    }
    
    // Set row height for spacing
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70  // Adjust this value to increase/decrease space between rows
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Custom FriendCell for displaying friend data
class FriendCell: UITableViewCell {
    var nameLabel: UILabel!
    var usernameLabel: UILabel!
    var profileImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profileImageView = UIImageView()
        profileImageView.backgroundColor = .gray
        profileImageView.layer.cornerRadius = 25
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        usernameLabel = UILabel()
        usernameLabel.font = UIFont.systemFont(ofSize: 14)
        usernameLabel.textColor = .gray
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(usernameLabel)
        
        // Set up constraints with padding
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),  // Add padding here
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),  // Padding
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),  // Padding
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
