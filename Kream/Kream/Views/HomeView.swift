//
//  HomeView.swift
//  Kream
//
//  Created by 선가연 on 11/4/24.
//

import UIKit
import Then

class HomeView: UIView {
    
    // 검색 텍스트 필드
    private let searchBarTextField = UITextField().then {
        $0.backgroundColor = .systemGray6
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
        $0.font = .systemFont(ofSize: 13.5)
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    // 알림 버튼
    private let notificationButton = UIButton().then {
        $0.setImage(UIImage(named: "icon_bell"), for: .normal)
    }
    
    // 세그먼트
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }
    
    // 배너 이미지
    let bannerImage = UIImageView().then {
        $0.image = UIImage(named: "image_ad_none")
    }
    
    // menu 콜렉션 뷰
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
        $0.minimumLineSpacing = 20
    }).then{
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: HomeMenuCollectionViewCell.identifier)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [
            searchBarTextField,
            notificationButton,
            segmentedControl,
            bannerImage,
            menuCollectionView
        ].forEach {
            addSubview($0)
        }
        
        // 오토 레이아웃 설정
        searchBarTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(51)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(notificationButton.snp.leading).offset(-15)
            $0.height.equalTo(40)
        }
        
        notificationButton.snp.makeConstraints {
            $0.centerY.equalTo(searchBarTextField)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBarTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(19)
        }
        
        bannerImage.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(bannerImage.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
}
