//
//  BuyViewController.swift
//  Kream
//
//  Created by 선가연 on 11/10/24.
//

import UIKit

class BuyViewController: UIViewController {
    
    private let buyView = BuyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = buyView
        setupActions()
    }

    private func setupActions() {
        buyView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func backButtonDidTap() {
        self.dismiss(animated: true)
    }
}
