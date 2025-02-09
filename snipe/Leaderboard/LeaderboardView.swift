//
//  LeaderboardView.swift
//  snipe
//
//  Created by Vivian Li on 2/9/25.
//

import UIKit

class LeaderboardView: UIView {
    var placeholders: [UIImageView] = []
    var leaderboardTitleLabel: UILabel!
    var leaderboardContainer: UIStackView!
    var backButton: UIButton!
    var voteButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black  // Dark theme
        
        setupPlaceholders()
        setupVoteButton()
        setupLeaderboardTitle()
        setupLeaderboardContainer()
        setupBackButton()
        setupConstraints()
        
        // Display leaderboard
        displayLeaderboard()
    }
    
    func setupPlaceholders() {
        for _ in 0..<3 {
            let placeholderImageView = UIImageView()
            placeholderImageView.backgroundColor = .darkGray
            placeholderImageView.contentMode = .scaleAspectFill
            placeholderImageView.layer.cornerRadius = 10
            placeholderImageView.clipsToBounds = true
            placeholderImageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(placeholderImageView)
            placeholders.append(placeholderImageView)
        }
    }
    
    func setupVoteButton() {
        voteButton = UIButton(type: .system)
        voteButton.setTitle("VOTE", for: .normal)
        voteButton.setTitleColor(.white, for: .normal)
        voteButton.backgroundColor = .gray
        voteButton.layer.cornerRadius = 10
        voteButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(voteButton)
    }

    func setupLeaderboardTitle() {
        leaderboardTitleLabel = UILabel()
        leaderboardTitleLabel.text = "LEADERBOARD"
        leaderboardTitleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        leaderboardTitleLabel.textAlignment = .center
        leaderboardTitleLabel.textColor = .white
        leaderboardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leaderboardTitleLabel)
    }

    func setupLeaderboardContainer() {
        leaderboardContainer = UIStackView()
        leaderboardContainer.axis = .vertical
        leaderboardContainer.spacing = 10
        leaderboardContainer.alignment = .fill
        leaderboardContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leaderboardContainer)
    }

    func setupBackButton() {
        backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .gray
        backButton.layer.cornerRadius = 10
        backButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Placeholder images (Top)
            placeholders[0].topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            placeholders[0].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            placeholders[0].widthAnchor.constraint(equalToConstant: 115),
            placeholders[0].heightAnchor.constraint(equalToConstant: 200),
            
            placeholders[1].topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            placeholders[1].centerXAnchor.constraint(equalTo: self.centerXAnchor),
            placeholders[1].widthAnchor.constraint(equalToConstant: 115),
            placeholders[1].heightAnchor.constraint(equalToConstant: 200),
            
            placeholders[2].topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            placeholders[2].trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            placeholders[2].widthAnchor.constraint(equalToConstant: 115),
            placeholders[2].heightAnchor.constraint(equalToConstant: 200),
            
            // Vote Button
            voteButton.topAnchor.constraint(equalTo: placeholders[0].bottomAnchor, constant: 20),
            voteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            voteButton.widthAnchor.constraint(equalToConstant: 100),
            voteButton.heightAnchor.constraint(equalToConstant: 40),

            // Leaderboard title
            leaderboardTitleLabel.topAnchor.constraint(equalTo: voteButton.bottomAnchor, constant: 20),
            leaderboardTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            // Leaderboard StackView
            leaderboardContainer.topAnchor.constraint(equalTo: leaderboardTitleLabel.bottomAnchor, constant: 20),
            leaderboardContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            leaderboardContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            // Back Button (Bottom)
            backButton.topAnchor.constraint(equalTo: leaderboardContainer.bottomAnchor, constant: 40),
            backButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalToConstant: 100),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func displayLeaderboard() {
        let players = [
            (rank: 1, username: "evelynxiao", kills: 7, deaths: 7, isTopPlayer: true),
            (rank: 2, username: "riko", kills: 6, deaths: 6, isTopPlayer: false),
            (rank: 3, username: "nicksimon", kills: 4, deaths: 4, isTopPlayer: false),
            (rank: 4, username: "aramigamer", kills: 2, deaths: 2, isTopPlayer: false),
            (rank: 5, username: "derick", kills: 2, deaths: 2, isTopPlayer: false)
        ]

        for player in players {
            let playerView = createPlayerView(rank: player.rank, username: player.username, kills: player.kills, deaths: player.deaths, isTopPlayer: player.isTopPlayer)
            leaderboardContainer.addArrangedSubview(playerView)
        }
    }

    func createPlayerView(rank: Int, username: String, kills: Int, deaths: Int, isTopPlayer: Bool) -> UIView {
        let container = UIView()
        container.layer.cornerRadius = isTopPlayer ? 20 : 10
        container.backgroundColor = isTopPlayer ? .darkGray : .clear
        container.layer.borderWidth = isTopPlayer ? 2 : 0
        container.layer.borderColor = isTopPlayer ? UIColor.white.cgColor : UIColor.clear.cgColor
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let rankLabel = UILabel()
        rankLabel.text = "\(rank)."
        rankLabel.textColor = .white
        rankLabel.font = UIFont.boldSystemFont(ofSize: 20)
        rankLabel.translatesAutoresizingMaskIntoConstraints = false

        let usernameLabel = UILabel()
        usernameLabel.text = "@\(username)"
        usernameLabel.textColor = .white
        usernameLabel.font = UIFont.systemFont(ofSize: 20)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false

        let killsLabel = UILabel()
        killsLabel.text = "\(kills)"
        killsLabel.textColor = .white
        killsLabel.font = UIFont.boldSystemFont(ofSize: 18)
        killsLabel.translatesAutoresizingMaskIntoConstraints = false

        let deathsLabel = UILabel()
        deathsLabel.text = "\(deaths)"
        deathsLabel.textColor = .white
        deathsLabel.font = UIFont.boldSystemFont(ofSize: 18)
        deathsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [rankLabel, usernameLabel, killsLabel, deathsLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])

        return container
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
