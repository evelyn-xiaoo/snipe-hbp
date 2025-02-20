import UIKit

class PublicProfile: UIView {
    
    var darkBackground: UIView!
    var nameLabel: UILabel!
    var usernameLabel: UILabel!
    var bioLabel: UILabel!
    var publicButton: UIButton!
    var privateButton: UIButton!
    var circle: UIView!
    var backArrowButton: UIButton!
    var pencilButton: UIButton!
    var collectionView: UICollectionView!
    
    var scroll: UIScrollView!
    var contentView: UIView!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        
        setupViews()
        setupCollectionView()
        initConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.alwaysBounceHorizontal = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scroll)
        
        contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(contentView)
        
        darkBackground = UIView()
        darkBackground.translatesAutoresizingMaskIntoConstraints = false
        darkBackground.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        darkBackground.layer.cornerRadius = 15
        contentView.addSubview(darkBackground)

        nameLabel = UILabel()
        nameLabel.text = "FIRST LAST"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        darkBackground.addSubview(nameLabel)

        usernameLabel = UILabel()
        usernameLabel.text = "@usernamehere"
        usernameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        usernameLabel.textColor = .white
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        darkBackground.addSubview(usernameLabel)

        bioLabel = UILabel()
        bioLabel.text = "bio here. idk what to say"
        bioLabel.font = UIFont.systemFont(ofSize: 12)
        bioLabel.textColor = .white
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.numberOfLines = 0
        darkBackground.addSubview(bioLabel)

        circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 42.5
        darkBackground.addSubview(circle)
        
        // Button setup for arrow.backward SF Symbol (Left Side)
        backArrowButton = UIButton(type: .system)
        let arrowImage = UIImage(systemName: "arrow.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        backArrowButton.setImage(arrowImage, for: .normal)
        backArrowButton.translatesAutoresizingMaskIntoConstraints = false
        darkBackground.addSubview(backArrowButton)

        // Button setup for pencil SF Symbol (Right Side)
        pencilButton = UIButton(type: .system)
        let pencilImage = UIImage(systemName: "pencil")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        pencilButton.setImage(pencilImage, for: .normal)
        pencilButton.translatesAutoresizingMaskIntoConstraints = false
        darkBackground.addSubview(pencilButton)
        
        publicButton = UIButton(type: .system)
        publicButton.setTitle("PUBLIC", for: .normal)
        publicButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        publicButton.setTitleColor(UIColor(red: 146/255, green: 16/255, blue: 16/255, alpha: 1), for: .normal)
        publicButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(publicButton)

        privateButton = UIButton(type: .system)
        privateButton.setTitle("PRIVATE", for: .normal)
        privateButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        privateButton.setTitleColor(.black, for: .normal)
        privateButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(privateButton)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 175, height: 210)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 20
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.contentInset.left = 12
        collectionView.contentInset.right = 12
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.register(GroupsCollectionViewCell.self, forCellWithReuseIdentifier: "groupsCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(collectionView)
    }
    
    private func initConstraints() {
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: 30),
            contentView.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scroll.heightAnchor, multiplier: 3),
            
            darkBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            darkBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            darkBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            darkBackground.heightAnchor.constraint(equalToConstant: 150),
            darkBackground.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: circle.topAnchor),
            
            usernameLabel.leadingAnchor.constraint(equalTo: backArrowButton.trailingAnchor, constant: 10),
            usernameLabel.topAnchor.constraint(equalTo: backArrowButton.topAnchor),

            bioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),

            
            circle.widthAnchor.constraint(equalToConstant: 85),
            circle.heightAnchor.constraint(equalTo: circle.widthAnchor),
            circle.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20), // Moved up 20
            circle.leadingAnchor.constraint(equalTo: backArrowButton.leadingAnchor, constant: 10),
            
            // Arrow Backward Button Constraints (Moved up 20)
            backArrowButton.topAnchor.constraint(equalTo: darkBackground.safeAreaLayoutGuide.topAnchor, constant: 5),  // 50 points above nameLabel
            backArrowButton.leadingAnchor.constraint(equalTo: darkBackground.leadingAnchor, constant: 10), // Moved left

            // Pencil Button Constraints (Moved up 20)
            pencilButton.topAnchor.constraint(equalTo: darkBackground.safeAreaLayoutGuide.topAnchor, constant: 5),  // 50 points above nameLabel
            pencilButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10), // Moved right

            
            publicButton.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -10),
            publicButton.topAnchor.constraint(equalTo: darkBackground.bottomAnchor, constant: 20),
            
            privateButton.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10),
            privateButton.topAnchor.constraint(equalTo: publicButton.topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: publicButton.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension PublicProfile: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "groupsCell", for: indexPath) as! GroupsCollectionViewCell
     //   cell.label.text = "\(indexPath.item)"
        return cell
    }
}

class GroupsCollectionViewCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 130)
        ])
        contentView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
