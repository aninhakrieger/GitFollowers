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
    let btnUser = GFButton(backgroundColor: .systemPurple, title: "Get Followers")
    
    var isUsernameEntered: Bool {
        print(textFieldUser.text!.isEmpty)
        return !textFieldUser.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        hideKeyboardWhenTappedAround()
        configLogoImageView()
        configureTextField()
        configurebtnUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
        textFieldUser.delegate = self
        
        NSLayoutConstraint.activate([
            textFieldUser.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 48),
            textFieldUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textFieldUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            textFieldUser.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configurebtnUser(){
        view.addSubview(btnUser)
        btnUser.addTarget(self, action: #selector(pushFollerwersVC), for: UIControl.Event.touchUpInside)
        
        NSLayoutConstraint.activate([
            btnUser.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            btnUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            btnUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            btnUser.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func pushFollerwersVC(){
        guard isUsernameEntered , let userName = textFieldUser.text?.trimmingCharacters(in: .whitespaces) else{
            presentAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for.", buttonTitle: "OK")
            return
        }
        
        let followersListVC = FollowersListVC()
        followersListVC.userName = userName
        followersListVC.title = userName
        self.navigationController?.pushViewController(followersListVC, animated: true)
    }

}

extension SearchVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollerwersVC()
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        textFieldUser.text = ""
    }
}
