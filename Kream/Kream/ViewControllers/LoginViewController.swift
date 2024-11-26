//
//  ViewController.swift
//  Kream
//
//  Created by 선가연 on 10/6/24.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    private let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        setupActions()
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    private func setupActions() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        loginView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func loginButtonDidTap() {
        guard let email = loginView.emailTextField.text, !email.isEmpty else {
            return }
        guard let password = loginView.passwordTextField.text, !password.isEmpty else {
            return
        }
        
        loginModel.saveUserEmail(email)
        loginModel.saveUserPassword(password)
        
        let baseViewController = BaseViewController()
        
        baseViewController.modalPresentationStyle = .fullScreen
        present(baseViewController, animated: true)
    }
    
    @objc private func kakaoLoginButtonDidTap() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    // 성공 시 동작 구현
                    _ = oauthToken
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
}

