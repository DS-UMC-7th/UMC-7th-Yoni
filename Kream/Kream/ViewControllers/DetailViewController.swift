//
//  DetailViewController.swift
//  Kream
//
//  Created by 선가연 on 11/8/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        setupDelegate()
    }
    
    private func setupDelegate() {
        detailView.otherColorItemCollectionView.dataSource = self
    }
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DetailModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as? DetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = DetailModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        
        return cell
    }
}
