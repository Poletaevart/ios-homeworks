//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Artem Poletaev on 20.07.2022.
//

import UIKit

class ProfileHeaderView:UIView{
    
    private lazy var avatarImageView: UIImageView = {
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
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Hipster Cat"
        textLabel.textAlignment = .center
        textLabel.textColor = .black
        textLabel.backgroundColor = .clear
        textLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(self.avatarImageView)
        self.addSubview(self.textLabel)
        self.addSubview(self.statusTextLabel)
        self.addSubview(self.textFild)
        self.addSubview(self.button)
        
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            textLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            textLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            
            statusTextLabel.bottomAnchor.constraint(equalTo: self.textFild.bottomAnchor),
            statusTextLabel.heightAnchor.constraint(equalToConstant: 100),
            statusTextLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            
            textFild.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -20),
            textFild.heightAnchor.constraint(equalToConstant: 40),
            textFild.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            textFild.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            button.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 32),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    @objc func buttonPressed(){
        if let text = statusTextLabel.text {
            print(text)}
        else {
            print("текущее поле пустое 0")}
        statusTextLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? ""
    }
    private var statusText:String = ""
    
}
