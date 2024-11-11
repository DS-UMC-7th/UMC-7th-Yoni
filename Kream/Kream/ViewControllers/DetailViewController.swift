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
        setupActions()
    }
    
    private func setupDelegate() {
        detailView.otherColorItemCollectionView.dataSource = self
    }
    
    private func setupActions() {
        detailView.buyButton.addTarget(self, action: #selector(buytButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func buytButtonDidTap() {
        let buytViewController = BuyViewController()
        
        present(buytViewController, animated: true)
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
