//
//  BaseViewController.swift
//  Kream
//
//  Created by 선가연 on 10/13/24.
//

import UIKit

class BaseViewController: UITabBarController {
    private let homeVC = HomeViewController()
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myVC = MyViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "icon_home"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "icon_style"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "icon_shop"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "icon_saved"), tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "icon_my"), tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
    }

}
