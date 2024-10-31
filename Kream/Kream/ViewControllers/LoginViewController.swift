//
//  ViewController.swift
//  Kream
//
//  Created by 선가연 on 10/6/24.
//

import UIKit

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
}

