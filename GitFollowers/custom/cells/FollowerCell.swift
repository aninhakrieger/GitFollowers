//
//  GFAvatarImageCell.swift
//  GitFollowers
//
//  Created by Ana Krieger WORK on 04/03/21.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
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
    
    func set(follower: Follower){
        avavatLabel.text = follower.login
        avatarImage.downloadImage(from: follower.avatarUrl)
    }
    
    private func configure(){
        addSubview(avatarImage)
        addSubview(avavatLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            avavatLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            avavatLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avavatLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            
        ])
    }
    
    
}
