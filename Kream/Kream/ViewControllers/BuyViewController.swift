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
    }

}
