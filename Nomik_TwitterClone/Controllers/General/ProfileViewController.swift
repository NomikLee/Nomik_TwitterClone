//
//  ProfileViewController.swift
//  Nomik_TwitterClone
//
//  Created by Pinocchio on 2023/12/10.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let ProfileTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Profile"
        
        let headerView = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: ProfileTableView.frame.width, height: 380))
        
        
        view.addSubview(ProfileTableView)
        ProfileTableView.delegate = self
        ProfileTableView.dataSource = self
        ProfileTableView.tableHeaderView = headerView
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            ProfileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ProfileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            ProfileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ProfileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else { return UITableViewCell() }
        return cell
    }
}
