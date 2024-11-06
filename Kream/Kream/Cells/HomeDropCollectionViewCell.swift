//
//  HomeDropCollectionViewCell.swift
//  Kream
//
//  Created by 선가연 on 11/6/24.
//

import UIKit

class HomeDropCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeDropCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    let brandLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 12)
        $0.textColor = .black
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    let priceLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 13)
        $0.textColor = .black
    }
    
    let priceDescriptionLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .systemGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [
            imageView,
            brandLabel,
            titleLabel,
            priceLabel,
            priceDescriptionLabel
        ].forEach {
            addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.width.equalTo(142)
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.horizontalEdges.equalTo(imageView).inset(4)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(3)
            $0.horizontalEdges.equalTo(imageView).inset(4)
        }
        
        priceLabel.snp.makeConstraints {
            $0.bottom.equalTo(priceDescriptionLabel.snp.top).offset(2)
            $0.horizontalEdges.equalTo(imageView).inset(4)
        }
        
        priceDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalTo(imageView).inset(4)
            $0.bottom.equalToSuperview()
        }
    }
}
