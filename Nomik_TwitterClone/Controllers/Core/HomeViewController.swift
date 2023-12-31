//
//  HomeViewController.swift
//  Nomik_TwitterClone
//
//  Created by Pinocchio on 2023/12/10.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    private func configureNavigationBar() {
        let size:CGFloat = 36
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = UIImage(named: "Twitter-X-Logo")
        
        let middleview = UIView(frame: CGRect(x: 0 , y: 0, width: size, height: size))
        middleview.addSubview(logoImageView)
        navigationItem.titleView = middleview
        
        let profileImage = UIImage(systemName: "person")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(didProfile))
    }
    
    @objc private func didProfile() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        
        configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        
        if Auth.auth().currentUser == nil {
            let vc = UINavigationController(rootViewController: OnboardingViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else
        {
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        return cell
    }
}

extension HomeViewController: TweetTableViewCellDelegate {
    func TweetTableViewCellDidTapReplay() {
        print("replay")
    }
    
    func TweetTableViewCellDidTapRetweet() {
        print("Retweet")
    }
    
    func TweetTableViewCellDidTapLike() {
        print("Like")
    }
    
    func TweetTableViewCellDidTapShare() {
        print("Share")
    }
    
}
