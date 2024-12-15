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
        buyView.sizeButtons.forEach {
            $0.addTarget(self, action: #selector(sizeButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc private func backButtonDidTap() {
        self.dismiss(animated: true)
    }
    
    @objc private func sizeButtonTapped(_ sender: UIButton) {
        for button in buyView.sizeButtons {
            button.isSelected = false
            button.layer.borderColor = UIColor.systemGray4.cgColor
        }

        sender.isSelected = true
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 1
    }
}
