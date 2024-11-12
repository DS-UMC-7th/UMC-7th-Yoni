//
//  HomeDropModel.swift
//  Kream
//
//  Created by 선가연 on 11/6/24.
//

import UIKit

struct HomeDropModel {
    let image: UIImage
    let brand: String
    let title: String
    let price: String
    let priceDescription: String
}

extension HomeDropModel {
    static func dummy() -> [HomeDropModel] {
        return [
            HomeDropModel(image: .imageHomeDrop1, brand: "MLB", title: "청키라이너 뉴욕양키스", price: "139,000원", priceDescription: "즉시 구매가"),
            HomeDropModel(image: .imageHomeDrop2, brand: "Jordan", title: "Jordan 1 Retro High OG Yellow Ochre", price: "139,000원", priceDescription: "즉시 구매가"),
            HomeDropModel(image: .imageHomeDrop3, brand: "Human Made", title: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원", priceDescription: "즉시 구매가")
        ]
    }
}
