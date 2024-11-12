//
//  HomeMenuModel.swift
//  Kream
//
//  Created by 선가연 on 11/4/24.
//

import UIKit

struct HomeMenuModel {
    let image: UIImage
    let title: String
}

extension HomeMenuModel {
    static func dummy() -> [HomeMenuModel] {
        return [
            HomeMenuModel(image: .imageHomeMenu1, title: "크림 드로우"),
            HomeMenuModel(image: .imageHomeMenu2, title: "실시간 차트"),
            HomeMenuModel(image: .imageHomeMenu3, title: "남성 추천"),
            HomeMenuModel(image: .imageHomeMenu4, title: "여성 추천"),
            HomeMenuModel(image: .imageHomeMenu5, title: "색다른 추천"),
            HomeMenuModel(image: .imageHomeMenu6, title: "정가 아래"),
            HomeMenuModel(image: .imageHomeMenu7, title: "윤세 24AW"),
            HomeMenuModel(image: .imageHomeMenu8, title: "올해의 베스트"),
            HomeMenuModel(image: .imageHomeMenu9, title: "10월 베네핏"),
            HomeMenuModel(image: .imageHomeMenu10, title: "아크네 선물")
        ]
    }
}
