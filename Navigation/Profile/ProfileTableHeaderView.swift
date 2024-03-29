//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Artem Poletaev on 05.09.2022.
//

import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView{
    
    private var statusText: String = ""
    
    private lazy var profileHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var hipsterLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.text = "Hipster Cat"
            textLabel.textAlignment = .center
            textLabel.textColor = .black
            textLabel.backgroundColor = .clear
            textLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            
            return textLabel
        }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "IMG_0924")
        imageView.layer.cornerRadius = 50
        imageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var statusTextLabel: UILabel = {
        let statusTextLabel = UILabel()
        statusTextLabel.text = "Waiting for something"
        statusTextLabel.textColor = .gray
        statusTextLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusTextLabel
    }()
    
    private lazy var textFild: UITextField = {
        let textFild = UITextField()
        textFild.textColor = .black
        textFild.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textFild.layer.borderWidth = 1
        textFild.layer.borderColor = UIColor(ciColor: .black).cgColor
        textFild.layer.cornerRadius = 12
        textFild.backgroundColor = .white
        textFild.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textFild.translatesAutoresizingMaskIntoConstraints = false
        return textFild
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor(ciColor: .black).cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Set status", for: .normal)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(reuseIdentifier identifier: String?) {
        super.init(reuseIdentifier: identifier)
        setupView()
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        setupView()
    }
    
    private func setupView() {
        self.addSubview(self.profileHeaderView)
        
        self.addSubview(self.avatarImageView)
        self.addSubview(self.hipsterLabel)
        self.addSubview(self.statusTextLabel)
        self.addSubview(self.textFild)
        self.addSubview(self.button)
        
        
        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            hipsterLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            hipsterLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            
            statusTextLabel.bottomAnchor.constraint(equalTo: textFild.bottomAnchor),
            statusTextLabel.heightAnchor.constraint(equalToConstant: 100),
            statusTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextLabel.leadingAnchor.constraint(equalTo: hipsterLabel.leadingAnchor),
            
            textFild.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            textFild.heightAnchor.constraint(equalToConstant: 40),
            textFild.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            textFild.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
            button.heightAnchor.constraint(equalToConstant: 50)

        ])
        
    }
    @objc func buttonPressed(){
        if let text = statusTextLabel.text {
            print(text)}
        else {
            print("текущее поле пустое ")}
        statusTextLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? ""
    }
    
}


