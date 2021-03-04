//
//  FollowersListVC.swift
//  GitFollowers
//
//  Created by Ana Krieger WORK on 03/03/21.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var userName:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let userName = userName else{
            return
        }
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { (followers, erroMessage) in
            guard let followers = followers else{
                self.presentAlertOnMainThread(title: "Bad Stuff Happend", message: erroMessage!, buttonTitle: "OK")
                return
            }
            
            print("Followers.count = \(followers.count)")
            print(followers)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }


}
