//
//  ViewController.swift
//  Kream
//
//  Created by 선가연 on 10/6/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }

    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
}

