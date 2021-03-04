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

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }


}
