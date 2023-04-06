//
//  PhotoViewModel.swift
//  Navigation
//
//  Created by Artem Poletaev on 06.04.2023.
//

import Foundation
import StorageService

final class PhotoViewModel {
    var ImagesArray: [PostImage]
    
    var ImageNames: [PostImage]? {
        didSet {
            self.imageNameDidChenge?(self)
        }
    }
    
    init(model: [PostImage]) {
        self.ImagesArray = model
    }
    
    var imageNameDidChenge: ((PhotoViewModel) -> ())?
    
    func showMagic() {
        ImageNames = ImagesArray
    }
}
