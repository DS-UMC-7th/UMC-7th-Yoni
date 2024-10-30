//
//  SavedModel.swift
//  Kream
//
//  Created by 선가연 on 10/29/24.
//

import UIKit

struct SavedModel {
    let image: String
    let title: String
    let description: String
    let price: String
    let bookmark: Bool
}

// 더미 데이터
final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(image: "saved1.png", title: "손오공이 잃어버린 머리띠 반쪽", description: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", price: "942,192,000원", bookmark: true),
        SavedModel(image: "saved2.png", title: "골드 반지", description: "결혼 준비하는 당신?! 약혼자에게 이 반지를 선물하는 건 어때요?!", price: "12,000원", bookmark: true),
        SavedModel(image: "saved3.png", title: "하얀 신발", description: "짝퉁 나이키 신발! 정말 푹신푹신해서 걷다가 졸려서 넘어지지 않게 조심하세요", price: "942,192,000원", bookmark: true),
        SavedModel(image: "saved4.png", title: "에베레스트 다이아 반지", description: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈 것인가??", price: "1,292,999,000원", bookmark: true),
        SavedModel(image: "saved5.png", title: "아디다스다 신발", description: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", price: "120,000원", bookmark: true),
        SavedModel(image: "saved6.png", title: "황제 잠옷", description: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", price: "120,000,000원", bookmark: true),
        SavedModel(image: "saved7.png", title: "고장난 기타", description: "블라블라블라블라 블라블라블라블라블라", price: "120,000원", bookmark: true),
        SavedModel(image: "saved8.png", title: "하얀 음료", description: "이 음료를 마시면 건강해져요 근데 어디가 건강해질까요? 한 번 마셔겠어요", price: "120,000원", bookmark: true)
    ]
}
