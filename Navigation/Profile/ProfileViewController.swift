//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Artem Poletaev on 20.07.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    
    private var viewModel: [Post] = [
        Post(author: "Очень странные дела", description: "Сериал о двух мирах", image: "Post1", views: 1000, likes: 900),
        Post(author: "Удача", description: "Мультик про кота и девочку без удачи", image: "Post2", views: 500, likes: 450),
        Post(author: "Медленные лошади", description: "Сериал про неудачников из m5", image: "Post3", views: 700, likes: 600),
        Post(author: "Не сработало", description: "Сериал про стартап", image: "Post4", views: 455, likes: 355)]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }

    private func setupNavigationBar() {
       navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? ProfileTableHeaderView {
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(200.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell {
            cell.authorLabel.text = viewModel[indexPath.row].author
            cell.postImageView.image = UIImage(named: viewModel[indexPath.row].image)
            cell.descriptionLabel.text = viewModel[indexPath.row].description
            cell.likesViewsLabel.text = "views: \(viewModel[indexPath.row].views) likes: \(viewModel[indexPath.row].likes)"
            return cell
        }
            return UITableViewCell()
    }
}
