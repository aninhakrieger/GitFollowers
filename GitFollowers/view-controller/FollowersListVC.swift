//
//  FollowersListVC.swift
//  GitFollowers
//
//  Created by Ana Krieger WORK on 03/03/21.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var userName:String?
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        getFollowers()
        configureColletionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureColletionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.register(GFAvatarImageCell.self, forCellWithReuseIdentifier: GFAvatarImageCell.identifier)
        collectionView.backgroundColor = .systemPink
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFollowers(){
        guard let userName = userName else{
            return
        }
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { result in
            switch result{
            case .success(let followers):
                print("Followers.count = \(followers.count)")
                print(followers)
            case .failure(let error):
                self.presentAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }


}
