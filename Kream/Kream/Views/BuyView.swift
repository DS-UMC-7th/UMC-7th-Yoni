//
//  BuyView.swift
//  Kream
//
//  Created by 선가연 on 11/10/24.
//

import UIKit

class BuyView: UIView {
    // MARK: - 메인 레이아웃
    // 제목 레이블
    private let titleLabel = UILabel().then {
        $0.text = "구매하기"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    // 부제목 레이블
    private let subTitleLabel = UILabel().then {
        $0.text = "(가격 단위: 원)"
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 10)
    }
    
    // 뒤로가기 버튼
    let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
    }
    
    // 상품 이미지 뷰
    private let itemImageView = UIImageView().then {
        $0.image = UIImage(named: "image_detail_item")
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    // 상품 이름 레이블
    private let nameLable = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14)
    }
    
    // 상품 한국어 이름 레이블
    private let krNameLabel = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 12)
    }

    // 사이즈 버튼 커스텀 메서드
    private func createButtonConfig(title: String, subtitle: String) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        
        config.title = title
        config.subtitle = subtitle
        config.titleAlignment = .center
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        
        // 타이틀 속성 설정
        var titleAttributes = AttributedString(title)
        titleAttributes.font = UIFont.systemFont(ofSize: 14)
        config.attributedTitle = titleAttributes

        // 서브타이틀 속성 설정
        var subtitleAttributes = AttributedString(subtitle)
        subtitleAttributes.font = UIFont.systemFont(ofSize: 12)
        subtitleAttributes.foregroundColor = UIColor.red
        config.attributedSubtitle = subtitleAttributes
        
        return config
    }
    
    // 사이즈 버튼 생성 메서드
    private func createSizeButton(title: String, subtitle: String) -> UIButton {
        let button = UIButton(configuration: createButtonConfig(title: title, subtitle: subtitle))
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray6.cgColor
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
    }
    
    // 사이즈 버튼 배열
    private lazy var sizeButtons: [UIButton] = [
        createSizeButton(title: "S", subtitle: "360,000"),
        createSizeButton(title: "M", subtitle: "360,000"),
        createSizeButton(title: "L", subtitle: "360,000"),
        createSizeButton(title: "XL", subtitle: "360,000"),
        createSizeButton(title: "XXL", subtitle: "360,000")
    ]
    
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
    
    // 구매, 판매 버튼 스택 뷰
    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 6
        $0.distribution = .fillEqually
    }
    
    // 빠른 배송 버튼
    let speedDeliveryButton = UIButton().then {
        $0.setImage(UIImage(named: "button_buy_speed"), for: .normal)
    }
    
    // 일반 배송 버튼
    let generalDeliveryButton = UIButton().then {
        $0.setImage(UIImage(named: "button_buy_general"), for: .normal)
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
        bottomView.addSubview(stackView)
        stackView.addArrangedSubview(speedDeliveryButton)
        stackView.addArrangedSubview(generalDeliveryButton)
        
        [
            titleLabel,
            subTitleLabel,
            backButton,
            itemImageView,
            nameLable,
            krNameLabel,
            bottomView,
        ].forEach {
            addSubview($0)
        }
        
        sizeButtons.forEach {
            addSubview($0)
        }
        
        // 오토 레이아웃 설정
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.width.equalTo(20)
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(91)
        }
        
        nameLable.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.top).offset(18)
            $0.leading.equalTo(itemImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        krNameLabel.snp.makeConstraints {
            $0.top.equalTo(nameLable.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(nameLable)
        }
        
        bottomView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(100)
            $0.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().inset(38)
        }
        
        var previousButton: UIButton?
        for (index, button) in sizeButtons.enumerated() {
            button.snp.makeConstraints {
                $0.width.equalTo(110)
                $0.height.equalTo(47)
                
                if index < 3 {
                    $0.top.equalTo(itemImageView.snp.bottom).offset(35)
                } else {
                    $0.top.equalTo(sizeButtons[0].snp.bottom).offset(8)
                }
                
                if index % 3 == 0 {
                    $0.leading.equalToSuperview().offset(15)
                } else {
                    if let prev = previousButton {
                        $0.leading.equalTo(prev.snp.trailing).offset(7)
                    }
                }
                
                if index % 3 == 2 {
                    $0.trailing.equalToSuperview().offset(-15)
                }
            }
            previousButton = button
        }
    }

}
