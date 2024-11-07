//
//  HomeView.swift
//  Kream
//
//  Created by 선가연 on 11/4/24.
//

import UIKit
import Then

class HomeView: UIView {
    
    // 스크롤 뷰
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    // 컨텐트 뷰
    private let contentView = UIView()
    
    // MARK: - 상단 레이아웃
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
    
    // MARK: - 메인 레이아웃
    // 배너 이미지
    let bannerImage = UIImageView().then {
        $0.image = UIImage(named: "image_ad_none")
    }
    
    // menu 콜렉션 뷰
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
        $0.minimumLineSpacing = 20
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: HomeMenuCollectionViewCell.identifier)
    }
    
    // MARK: - 발매 상품 레이아웃
    // 구분선 1
    let divideLine1 = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    // 발매 상품 제목
    let dropTitleLabel = UILabel().then {
        $0.text = "Just Dropped"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    // 발매 상품 부제목
    let dropSubTitleLabel = UILabel().then {
        $0.text = "발매 상품"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .systemGray
    }
    
    // 발매 상품 컬렉션 뷰
    let dropCollectionView = UICollectionView(frame: .zero, collectionViewLayout:
                                                UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 142, height: 237)
        $0.minimumInteritemSpacing = 9
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.register(HomeDropCollectionViewCell.self, forCellWithReuseIdentifier: HomeDropCollectionViewCell.identifier)
    }
    
    // MARK: - 본격 한파대비! 연말 필수템 모음 레이아웃
    // 구분선
    let divideLine2 = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    // 아이템 제목
    let itemTitleLabel = UILabel().then {
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    // 아이템 부제목
    let itemSubTitleLabel = UILabel().then {
        $0.text = "#해피홀리룩챌린지"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .systemGray
    }
    
    // 아이템 컬렉션 뷰
    let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout:
                                                UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 124, height: 165)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.register(HomeItemCollectionViewCell.self, forCellWithReuseIdentifier: HomeItemCollectionViewCell.identifier)
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
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // contentView 내부에 추가
        [
            searchBarTextField,
            notificationButton,
            segmentedControl,
            bannerImage,
            menuCollectionView,
            divideLine1,
            dropTitleLabel,
            dropSubTitleLabel,
            dropCollectionView,
            divideLine2,
            itemTitleLabel,
            itemSubTitleLabel,
            itemCollectionView
        ].forEach {
            contentView.addSubview($0)
        }
        
        // 오토 레이아웃 설정
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        searchBarTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
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
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(19)
        }
        
        bannerImage.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(bannerImage.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(182)
        }
        
        divideLine1.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        dropTitleLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        dropSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(dropTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(dropTitleLabel.snp.leading)
        }
        
        dropCollectionView.snp.makeConstraints {
            $0.top.equalTo(dropSubTitleLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(237)
        }
        
        divideLine2.snp.makeConstraints {
            $0.top.equalTo(dropCollectionView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        itemTitleLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        itemSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(itemTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(itemTitleLabel.snp.leading)
        }
        
        itemCollectionView.snp.makeConstraints {
            $0.top.equalTo(itemSubTitleLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(165)
            $0.bottom.equalToSuperview()
        }
    }
}
