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
        
        self.transitionToMainScreen()
    }
    
    @objc private func kakaoLoginButtonDidTap() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else if let oauthToken = oauthToken {
                    print("loginWithKakaoTalk() success.")
                    self.saveUserInfo(oauthToken: oauthToken)
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else if let oauthToken = oauthToken {
                    print("loginWithKakaoAccount() success.")
                    self.saveUserInfo(oauthToken: oauthToken)
                }
            }
        }
    }
    
    private func saveUserInfo(oauthToken: OAuthToken) {
        UserApi.shared.me { [weak self] (user, error) in
            guard let self = self else { return }
            if let error = error {
                print("Failed to fetch user info: \(error.localizedDescription)")
            } else if let user = user {
                let nickname = user.kakaoAccount?.profile?.nickname ?? "Unknown"
                KeychainService.shared.saveToken(token: oauthToken.accessToken, nickname: nickname)
                print("User Info Saved: \(nickname)")
                self.transitionToMainScreen()
            }
        }
    }
    
    // 로그인
    private func transitionToMainScreen() {
        let baseViewController = BaseViewController()
        baseViewController.modalPresentationStyle = .fullScreen
        present(baseViewController, animated: true)
    }
}
    
