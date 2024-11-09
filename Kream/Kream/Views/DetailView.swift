//
//  DetailView.swift
//  Kream
//
//  Created by 선가연 on 11/8/24.
//

import UIKit

class DetailView: UIView {
    
    // MARK: - 메인 레이아웃
    // 아이템 이미지 뷰
    private let itemImageView = UIImageView().then {
        $0.image = UIImage(named: "image_detail_item")
    }
    
    // 다른 색상 아이템 컬렉션 뷰
    let otherColorItemCollectionView = UICollectionView(frame: .zero, collectionViewLayout:
                                                UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
    }
    
    // 가격 설명 레이블
    private let priceDescriptionLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    // 가격 레이블
    private let priceLabel = UILabel().then {
        $0.text = "228,000원"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    // 제품명 레이블
    private let nameLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    
    // 한국어 제품명 레이블
    private let krNameLabel = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.textColor = .systemGray
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    // MARK: - 하단 레이아웃
    // 하단 컨테이너 뷰
    private let bottomView = UIView().then {
        $0.backgroundColor = .white
        
        // 상단 테두리 추가
        let topBorder = CALayer()
        topBorder.backgroundColor = UIColor.systemGray6.cgColor
        topBorder.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1) // 테두리 두께 설정
        $0.layer.addSublayer(topBorder)
    }
    
    // 북마크 버튼
    private let bookmarkButton = UIButton().then {
        $0.setImage(UIImage(systemName: "bookmark"), for: .normal)
        $0.setTitle("2,122", for: .normal)
        $0.tintColor = .black
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    // 구매, 판매 버튼 스택 뷰
    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 6
        $0.distribution = .fillEqually
    }
    
    // 구매 버튼
    let buyButton = UIButton().then {
        $0.setImage(UIImage(named: "button_buy"), for: .normal)
    }
    
    // 판매 버튼
    let sellButton = UIButton().then {
        $0.setImage(UIImage(named: "button_sell"), for: .normal)
    }
    
    // MARK: - 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        bottomView.addSubview(bookmarkButton)
        bottomView.addSubview(stackView)
        stackView.addArrangedSubview(buyButton)
        stackView.addArrangedSubview(sellButton)
        
        [
            itemImageView,
            otherColorItemCollectionView,
            priceDescriptionLabel,
            priceLabel,
            nameLabel,
            krNameLabel,
            bottomView
        ].forEach {
            addSubview($0)
        }
        
        // 오토 레이아웃 설정
        itemImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(13.71)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(self.snp.width)
            $0.height.equalTo(373)
        }
        
        otherColorItemCollectionView.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(53)
        }
        
        priceDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(otherColorItemCollectionView.snp.bottom).offset(23)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(priceDescriptionLabel.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        krNameLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        bottomView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(95)
            $0.bottom.equalToSuperview()
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.centerY.equalTo(stackView)
            $0.leading.equalToSuperview().offset(16)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(bookmarkButton.snp.trailing).offset(19)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().inset(38)
        }
    }
}
