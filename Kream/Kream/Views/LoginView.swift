//
//  LoginView.swift
//  Kream
//
//  Created by 선가연 on 10/6/24.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 컴포넌트 추가
    private func addComponents() {
        self.addSubview(logoImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
    }
    
    // 크림 로고 이미지
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "kream_logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // 이메일 레이블
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 이메일 텍스트 필드
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예) kream@kream.co.kr"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 비밀번호 레이블
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 비밀번호 텍스트 필드
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해 주세요"
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 로그인 버튼
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor.systemGray4
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 카카오 로그인 버튼
    private let kakaoLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카카오로 로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 애플 로그인 버튼
    private let appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apple로 로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 오토 레이아웃 설정
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // 크림 로고 이미지
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            logoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 53),
            logoImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53),
            
            // 이메일 레이블
            emailLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 87),
            emailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            
            // 이메일 텍스트 필드
            emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 8),
            emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            emailTextField.heightAnchor.constraint(equalToConstant: 38),
            
            // 비밀번호 레이블
            passwordLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 17),
            passwordLabel.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor, constant: 0),
            
            // 비밀번호 텍스트 필드
            passwordTextField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: self.emailLabel.leadingAnchor, constant: 0),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: 0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 38),
            
            // 로그인 버튼
            loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 17),
            loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor, constant: 0),
            loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor, constant: 0),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            // 카카오 로그인 버튼
            kakaoLoginButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor, constant: 0),
            kakaoLoginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor, constant: 0),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 38),
            
            // 애플 로그인 버튼
            appleLoginButton.topAnchor.constraint(equalTo: self.kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor, constant: 0),
            appleLoginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor, constant: 0),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
}
