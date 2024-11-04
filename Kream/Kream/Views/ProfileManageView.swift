//
//  ProfileManageView.swift
//  Kream
//
//  Created by 선가연 on 10/15/24.
//

import UIKit

class ProfileManageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(profileImageView)
        self.addSubview(profileLabel)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(changeEmailButton)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(changePasswordButton)
    }
    
    // 프로필 이미지
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "profile_image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    // 프로필 정보 레이블
    private let profileLabel: UILabel = {
        let label = UILabel()
        
        label.text = "프로필 정보"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    // 이메일 레이블
    private let emailLabel: UILabel = {
        let label = UILabel()
        
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    // 이메일 텍스트 필드
    private let emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.text = "example@naver.com"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.cornerRadius = 10
        
        return textField
    }()
    
    // 이메일 변경 버튼
    private let changeEmailButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    // 비밀번호 레이블
    private let passwordLabel: UILabel = {
        let label = UILabel()
        
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    // 비밀번호 텍스트 필드
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.text = "****************"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    // 비밀번호 변경 버튼
    private let changePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    // 오토 레이아웃 설정
    private func setupConstraints() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(144)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(90)
        }
        
        profileLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(27)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(profileLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(27)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(27)
            $0.trailing.equalTo(changeEmailButton.snp.leading).offset(-9)
            $0.height.equalTo(32)
        }
        
        changeEmailButton.snp.makeConstraints {
            $0.centerY.equalTo(emailTextField)
            $0.trailing.equalToSuperview().offset(-17)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(27)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(27)
            $0.trailing.equalTo(changePasswordButton.snp.leading).offset(-9)
            $0.height.equalTo(32)
        }
        
        changePasswordButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalToSuperview().offset(-17)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
    }
    
}
