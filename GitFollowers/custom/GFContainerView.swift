//
//  GFContainerView.swift
//  GitFollowers
//
//  Created by Ana Krieger WORK on 03/03/21.
//

import UIKit

class GFContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .systemBackground
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 16
        layer.borderWidth = 2
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    

}
