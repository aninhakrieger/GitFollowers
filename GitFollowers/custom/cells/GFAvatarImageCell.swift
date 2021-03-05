//
//  GFAvatarImageCell.swift
//  GitFollowers
//
//  Created by Ana Krieger WORK on 04/03/21.
//

import UIKit

class GFAvatarImageCell: UICollectionViewCell {
    
    static let identifier = "GFAvatarImageCell"
    let avatarImage = GFAvatarImage(frame: .zero)
    let avavatLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(avatarImage)
        addSubview(avavatLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            avavatLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: 12),
            avavatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avavatLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding)
            
        ])
    }
    
    
}
