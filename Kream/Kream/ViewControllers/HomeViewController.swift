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
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.bannerImage.isHidden = false
            homeView.menuCollectionView.isHidden = false
        }
        else {
            homeView.bannerImage.isHidden = true
            homeView.menuCollectionView.isHidden = true
        }
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
