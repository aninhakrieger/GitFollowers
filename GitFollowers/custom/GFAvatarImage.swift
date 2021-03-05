//
//  GFAvatarImage.swift
//  GitFollowers
//
//  Created by Ana Krieger WORK on 04/03/21.
//

import UIKit

class GFAvatarImage: UIImageView {
    
    let placeHolderImage = UIImage(named: "avatar-placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }

}
