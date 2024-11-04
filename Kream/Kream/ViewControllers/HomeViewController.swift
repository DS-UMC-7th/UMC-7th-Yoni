//
//  HomeViewController.swift
//  Kream
//
//  Created by 선가연 on 10/13/24.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        setupDelegate()
    }

    private func setupDelegate() {
        homeView.menuCollectionView.dataSource = self
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeMenuModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCollectionViewCell.identifier, for: indexPath) as? HomeMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = HomeMenuModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].title
        
        return cell
    }
}
