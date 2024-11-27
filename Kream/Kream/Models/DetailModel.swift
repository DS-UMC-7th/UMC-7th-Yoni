//
//  DetailModel.swift
//  Kream
//
//  Created by 선가연 on 11/8/24.
//

import UIKit

struct DetailModel {
    let image: UIImage
}

extension DetailModel {
    static func dummy() -> [DetailModel] {
        return [
            DetailModel(image: .imageDetailOther1),
            DetailModel(image: .imageDetailOther2),
            DetailModel(image: .imageDetailOther3),
            DetailModel(image: .imageDetailOther4),
            DetailModel(image: .imageDetailOther5),
            DetailModel(image: .imageDetailOther6),
            DetailModel(image: .imageDetailOther7),
        ]
    }
}
