//
//  HomeItemModel.swift
//  Kream
//
//  Created by 선가연 on 11/7/24.
//

import UIKit

struct HomeItemModel {
    let image: UIImage
}

extension HomeItemModel {
    static func dummy() -> [HomeItemModel] {
        return [
            HomeItemModel(image: .imageHomeItem1),
            HomeItemModel(image: .imageHomeItem2),
            HomeItemModel(image: .imageHomeItem3)
        ]
    }
}
