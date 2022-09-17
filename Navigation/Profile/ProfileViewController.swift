//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Artem Poletaev on 20.07.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    
    private var movies: [Post] = StorageOfPosts.viewModel

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultcell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupView()
    }
    private func setupNavigationBar() {
          navigationController?.navigationBar.prefersLargeTitles = true
           navigationItem.title = "Profile"
       }
        
    private func setupView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cellOne = tableView.dequeueReusableCell(withIdentifier: "PhotosTableCell") as? PhotosTableViewCell else { return tableView.dequeueReusableCell(withIdentifier: "defaultcell", for: indexPath) }
        guard let cellTwo = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else { return tableView.dequeueReusableCell(withIdentifier: "defaultcell", for: indexPath) }
        cellTwo.authorLabel.text = movies[indexPath.row].author
        cellTwo.postImageView.image = UIImage(named: movies[indexPath.row].image)
        cellTwo.descriptionLabel.text = movies[indexPath.row].description
        cellTwo.likesViewsLabel.text = "views: \(movies[indexPath.row].views) likes: \(movies[indexPath.row].likes)"
        return indexPath.section == 0 ? cellOne : cellTwo
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section \(indexPath.section) - Row \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated:true)
        let vc = PhotosViewController()
        vc.textTitle = "Photo Gallery"
        indexPath.section == 0 ? navigationController?.pushViewController(vc, animated: true) : nil

    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section == 0{
                guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") else { return nil }
                return header
            } else {
                return nil
            }
        }
   }

