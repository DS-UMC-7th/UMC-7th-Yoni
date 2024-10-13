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
    }

    private lazy var myView: MyView = {
        let view = MyView()
        return view
    }()
}
