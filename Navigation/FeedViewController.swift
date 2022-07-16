//
//  FeedViewController.swift
//  Navigation
//
//  Created by Artem Poletaev on 16.07.2022.
//

import UIKit

class FeedViewController: UIViewController{
    
    override func viewDidLoad() {

            super.viewDidLoad()
            view.backgroundColor = .white
        self.view.addSubview(self.button)
        self.button.center = self.view.center

    }
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()

    
    @objc private func didTapButton() {
        let vc = PostViewController()
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true)
        
    }
}
