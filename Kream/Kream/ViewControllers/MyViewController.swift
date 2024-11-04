//
//  MyViewController.swift
//  Kream
//
//  Created by 선가연 on 10/13/24.
//

import UIKit


class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
        setupActions()
    }

    private lazy var myView: MyView = {
        let view = MyView()
        return view
    }()
    
    private func setupActions() {
        myView.profileManageButton.addTarget(self, action: #selector(profileManageButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func profileManageButtonDidTap() {
        let profileManageViewController = ProfileManageViewController()
        
        // 프로필 이미지 전달
        profileManageViewController.profileManageView.profileImageView.image = myView.profileImageView.image

        navigationController?.pushViewController(profileManageViewController, animated: true)
    }
}
