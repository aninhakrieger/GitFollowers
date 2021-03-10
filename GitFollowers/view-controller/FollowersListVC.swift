//
//  FollowersListVC.swift
//  GitFollowers
//
//  Created by Ana Krieger WORK on 03/03/21.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section{ case main }
    
    var userName:String!
    var collectionView: UICollectionView!
    var dataSouce: UICollectionViewDiffableDataSource<Section, Follower>!
    var followers: [Follower] = []
    
    var page = 1
    var hasMoreFollowers = true

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        getFollowers(username: userName, page: page)
        configureColletionView()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureColletionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
        collectionView.backgroundColor = .systemBackground
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFollowers(username: String,page:Int){
        
        NetworkManager.shared.getFollowers(for: userName, page: page) {[weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollowers = false }
                self.followers.append(contentsOf: followers)
                self.updateData()
            case .failure(let error):
                self.presentAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func configureDataSource(){
        dataSouce = UICollectionViewDiffableDataSource<Section,Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as! FollowerCell
            cell.set(follower:follower)
            return cell
        })
    }
    
    func updateData(){
        var snapshot = NSDiffableDataSourceSnapshot<Section,Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSouce.apply(snapshot, animatingDifferences: true) }
    }


}

extension FollowersListVC: UICollectionViewDelegate{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height{
            guard hasMoreFollowers else { return }
            page+=1
            getFollowers(username: userName, page: page)
        }
    }
}

