//
//  SearchVC.swift
//  GitFollowers
//
//  Created by Ana Krieger WORK on 02/03/21.
//

import UIKit

class SearchVC: UIViewController {
    
    let imageLogo = UIImageView()
    let textFieldUser = GFTextField()
    let btnUser = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configLogoImageView()
        configureTextField()
        configurebtnUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configLogoImageView(){
        view.addSubview(imageLogo)
        
        imageLogo.image = UIImage(named: "gh-logo")
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            imageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 200),
            imageLogo.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField(){
        view.addSubview(textFieldUser)
        
        NSLayoutConstraint.activate([
            textFieldUser.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 48),
            textFieldUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textFieldUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            textFieldUser.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configurebtnUser(){
        view.addSubview(btnUser)
        
        NSLayoutConstraint.activate([
            btnUser.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            btnUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            btnUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            btnUser.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    


}
