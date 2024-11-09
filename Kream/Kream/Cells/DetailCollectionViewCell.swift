//
//  DetailCollectionViewCell.swift
//  Kream
//
//  Created by 선가연 on 11/8/24.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DetailCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.height.equalTo(53)
        }
    }
}
