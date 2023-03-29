//
//  FeedModel.swift
//  Navigation
//
//  Created by Artem Poletaev on 29.03.2023.
//

import UIKit

class FeedModel {
    private let secret = "123"
    
    func check(word: String) -> Bool {
         word == secret
    }
}
