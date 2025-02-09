/*
 import UIKit

class FriendsProfile: UIView, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    var darkBackground: UIView!
    var nameLabel: UILabel!
    var usernameLabel: UILabel!
    var bioLabel: UILabel!
    var publicButton: UIButton!
    var privateButton: UIButton!
    var circle: UIView!
    var backArrowButton: UIButton!
    var pencilButton: UIButton!
    var friendsCollectionView: UICollectionView!
    var privateCollectionView: UICollectionView!
    var isPrivateView = false


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupViews()
        setupFriendsCollectionView()
        initConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        darkBackground = UIView()
        darkBackground.translatesAutoresizingMaskIntoConstraints = false
        darkBackground.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        darkBackground.layer.cornerRadius = 15
        self.addSubview(darkBackground)

        nameLabel = UILabel()
        nameLabel.text = "FIRST LAST"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)

        usernameLabel = UILabel()
        usernameLabel.text = "@usernamehere"
        usernameLabel.font = UIFont.systemFont(ofSize: 12)
        usernameLabel.textColor = .white
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameLabel)

        bioLabel = UILabel()
        bioLabel.text = "bio here. idk what to say"
        bioLabel.font = UIFont.systemFont(ofSize: 12)
        bioLabel.textColor = .white
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.numberOfLines = 0
        self.addSubview(bioLabel)

        circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 42.5
        self.addSubview(circle)
        
        backArrowButton = UIButton(type: .system)
        let arrowImage = UIImage(systemName: "arrow.backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        backArrowButton.setImage(arrowImage, for: .normal)
        backArrowButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backArrowButton)

        pencilButton = UIButton(type: .system)
        let pencilImage = UIImage(systemName: "pencil")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        pencilButton.setImage(pencilImage, for: .normal)
        pencilButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pencilButton)
        
        publicButton = UIButton(type: .system)
        publicButton.setTitle("PUBLIC", for: .normal)
        publicButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        publicButton.setTitleColor(UIColor(red: 146/255, green: 16/255, blue: 16/255, alpha: 1), for: .normal)
        publicButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(publicButton)

        privateButton = UIButton(type: .system)
        privateButton.setTitle("PRIVATE", for: .normal)
        privateButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        privateButton.setTitleColor(.black, for: .normal)
        privateButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(privateButton)
    }
    
    private func setupFriendsCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 175, height: 210)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 15
        
        friendsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        friendsCollectionView.backgroundColor = .white
        friendsCollectionView.contentInset.left = 12
        friendsCollectionView.contentInset.right = 12
        friendsCollectionView.dataSource = self
        friendsCollectionView.delegate = self
        friendsCollectionView.register(GroupsFriendsCollectionViewCell.self, forCellWithReuseIdentifier: "groupsFriendsCell")
        friendsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(friendsCollectionView)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            darkBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            darkBackground.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 260),
            darkBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            darkBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 130),
            
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 140),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),

            bioLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            bioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 30),
            bioLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            circle.widthAnchor.constraint(equalToConstant: 85),
            circle.heightAnchor.constraint(equalToConstant: 85),
            circle.topAnchor.constraint(equalTo: self.topAnchor, constant: 115),
            circle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            backArrowButton.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -40),
            backArrowButton.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -65),

            pencilButton.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -40),
            pencilButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 80),
            
            publicButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            publicButton.topAnchor.constraint(equalTo: darkBackground.bottomAnchor, constant: 20),
            
            privateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            privateButton.topAnchor.constraint(equalTo: darkBackground.bottomAnchor, constant: 20),
            
            friendsCollectionView.topAnchor.constraint(equalTo: publicButton.bottomAnchor, constant: 20),
            friendsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            friendsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
*/
