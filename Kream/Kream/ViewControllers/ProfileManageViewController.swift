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
        
        profileManageView.emailTextField.text = loginModel.loadUserId()
        profileManageView.passwordTextField.text = loginModel.loadUserPassword()
    }
    
    lazy var profileManageView: ProfileManageView = {
        let view = ProfileManageView()
        return view
    }()
    
}
