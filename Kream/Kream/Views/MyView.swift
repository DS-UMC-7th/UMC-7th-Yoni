//
//  MyView.swift
//  Kream
//
//  Created by 선가연 on 10/13/24.
//

import UIKit
import SnapKit

class MyView: UIView {

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
        self.addSubview(settingButton)
        self.addSubview(cameraButton)
        self.addSubview(profileImageView)
        self.addSubview(userNameLabel)
        self.addSubview(followerLabel)
        self.addSubview(followingLabel)
        self.addSubview(profileManageButton)
        self.addSubview(profileShareButton)
    }
    
    private let settingButton: UIButton = {
        let button = UIButton(type: .system)
        let iconImage = UIImage(named: "icon_setting")
        
        button.setImage(iconImage, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let cameraButton: UIButton = {
        let button = UIButton(type: .system)
        let iconImage = UIImage(named: "icon_camera")
        
        button.setImage(iconImage, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "profile_image")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Seon_iOS"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()


    private let followerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "팔로워 326"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private let followingLabel: UILabel = {
        let label = UILabel()
        
        label.text = "팔로잉 20"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    let profileManageButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    private let profileShareButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private func setupConstraints() {
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.height.equalTo(25)
        }

        cameraButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.trailing.equalToSuperview().offset(-33.5)
            $0.width.height.equalTo(25)
        }

        profileImageView.snp.makeConstraints {
            $0.top.equalTo(settingButton.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.height.equalTo(90)
        }

        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(21)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }

        followerLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(userNameLabel.snp.leading)
        }

        followingLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(followerLabel.snp.trailing).offset(8)
        }

        profileManageButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(32.5)
            $0.height.equalTo(26)
            $0.width.equalTo(profileShareButton.snp.width)
        }

        profileShareButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(26)
            $0.leading.equalTo(profileManageButton.snp.trailing).offset(14)
            $0.trailing.equalToSuperview().offset(-32.5)
            $0.height.equalTo(26)
        }
    }
    
}
