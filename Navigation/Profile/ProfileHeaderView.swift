//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Artem Poletaev on 20.07.2022.
//

import UIKit

class ProfileHeaderView:UIView{
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 135, height: 135))
        imageView.image = UIImage(named: "IMG_0924")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor(ciColor: .white).cgColor
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel(frame: CGRect(x: 165, y: 10, width: 200, height: 100))
        textLabel.text = "Hipster Cat"
        textLabel.textColor = .black
        textLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return textLabel
    }()
    
    private lazy var statusTextLabel: UILabel = {
        let statusTextLabel = UILabel(frame: CGRect(x: 165, y: 100, width: 137, height: 60))
        statusTextLabel.text = "Waiting for something"
        statusTextLabel.textColor = .gray
        statusTextLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return statusTextLabel
    }()
    
    private lazy var textFild: UITextField = {
        let textFild = UITextField(frame: CGRect(x: 165, y: 150, width: 230, height: 40))
        textFild.textColor = .black
        textFild.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textFild.layer.borderWidth = 1
        textFild.layer.borderColor = UIColor(ciColor: .black).cgColor
        textFild.layer.cornerRadius = 12
        textFild.backgroundColor = .white
        textFild.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textFild
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 206, width: 380, height: 50))
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor(ciColor: .black).cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Set status", for: .normal)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
        
    }
    
    @objc func buttonPressed(){
        if let text = statusTextLabel.text {
            print(text)}
        else {
            print("текущее поле пустое")}
        statusTextLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? ""
    }
    private var statusText:String = ""
    
}
