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
        setupAction()
        setupDelegate()
    }
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate() {
        homeView.menuCollectionView.dataSource = self
        homeView.dropCollectionView.dataSource = self
        homeView.itemCollectionView.dataSource = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.bannerImage.isHidden = false
            homeView.menuCollectionView.isHidden = false
            homeView.divideLine1.isHidden = false
            homeView.dropTitleLabel.isHidden = false
            homeView.dropSubTitleLabel.isHidden = false
            homeView.dropCollectionView.isHidden = false
            homeView.divideLine2.isHidden = false
            homeView.itemTitleLabel.isHidden = false
            homeView.itemSubTitleLabel.isHidden = false
            homeView.itemCollectionView.isHidden = false
        }
        else {
            homeView.bannerImage.isHidden = true
            homeView.menuCollectionView.isHidden = true
            homeView.divideLine1.isHidden = true
            homeView.dropTitleLabel.isHidden = true
            homeView.dropSubTitleLabel.isHidden = true
            homeView.dropCollectionView.isHidden = true
            homeView.divideLine2.isHidden = true
            homeView.itemTitleLabel.isHidden = true
            homeView.itemSubTitleLabel.isHidden = true
            homeView.itemCollectionView.isHidden = true
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.menuCollectionView {
            return HomeMenuModel.dummy().count
        } else if collectionView == homeView.dropCollectionView {
            return HomeDropModel.dummy().count
        } else if collectionView == homeView.itemCollectionView {
            return HomeItemModel.dummy().count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.menuCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCollectionViewCell.identifier, for: indexPath) as? HomeMenuCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let list = HomeMenuModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].title
            
            return cell
        } else if collectionView == homeView.dropCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeDropCollectionViewCell.identifier, for: indexPath) as? HomeDropCollectionViewCell else {
                
                return UICollectionViewCell()
            }
            
            let list = HomeDropModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].title
            cell.brandLabel.text = list[indexPath.row].brand
            cell.priceLabel.text = list[indexPath.row].price
            
            return cell
        } else if collectionView == homeView.itemCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCollectionViewCell.identifier, for: indexPath) as? HomeItemCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let list = HomeItemModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
