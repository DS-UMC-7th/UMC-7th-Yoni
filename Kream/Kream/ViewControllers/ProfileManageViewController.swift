//
//  ProfileManageViewController.swift
//  Kream
//
//  Created by 선가연 on 10/13/24.
//

import UIKit

class ProfileManageViewController: UIViewController {
    
    private let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        self.title = "프로필 관리"
        
        profileManageView.emailTextField.text = loginModel.loadUserEmail()
        profileManageView.passwordTextField.text = loginModel.loadUserPassword()
        
        setupActions()
    }
    
    lazy var profileManageView: ProfileManageView = {
        let view = ProfileManageView()
        return view
    }()
    
    private func setupActions() {
        profileManageView.changeEmailButton.addTarget(self, action: #selector(changeEmailButtonDidTap), for: .touchUpInside)
        profileManageView.changePasswordButton.addTarget(self, action: #selector(changePasswordButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func changeEmailButtonDidTap() {
        if profileManageView.emailTextField.isUserInteractionEnabled {
            if let newEmail = profileManageView.emailTextField.text {
                loginModel.saveUserEmail(newEmail)
            }
            profileManageView.changeEmailButton.setTitle("변경", for: .normal)
            profileManageView.emailTextField.isUserInteractionEnabled = false
        } else {
            profileManageView.changeEmailButton.setTitle("확인", for: .normal)
            profileManageView.emailTextField.isUserInteractionEnabled = true
            profileManageView.emailTextField.becomeFirstResponder()
        }
    }
    
    @objc private func changePasswordButtonDidTap() {
        if profileManageView.passwordTextField.isUserInteractionEnabled {
            if let newPassword = profileManageView.passwordTextField.text {
                loginModel.saveUserPassword(newPassword)
            }
            profileManageView.changePasswordButton.setTitle("변경", for: .normal)
            profileManageView.passwordTextField.isUserInteractionEnabled = false
        } else {
            profileManageView.changePasswordButton.setTitle("확인", for: .normal)
            profileManageView.passwordTextField.isUserInteractionEnabled = true
            profileManageView.passwordTextField.becomeFirstResponder()
        }
    }
}
