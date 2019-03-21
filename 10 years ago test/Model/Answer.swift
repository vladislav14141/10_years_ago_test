//
//  Answer.swift
//  Personal Quiz
//
//  Created by Denis Bystruev on 14/03/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

struct Answer {
    var text: String
    var points: Int
}

enum PersonType: Character {
    case kid = "🐤", boy = "👷🏻‍♂️", men = "👨‍🦳", grand = "🤴"
    
    var definition: String {
        switch self {
        case .kid:
            return "Вы родились в нулевых и мало что знаете о таких вещах "
        case .boy:
            return "Вы были молоды и стоимость товаров вас коснулась мимолетно"
        case .men:
            return "Вы многое помните и вы активно следили за ценами на товары"
        case .grand:
            return "Вы активно следили за ценами и отлично помните, что с ними происходило"
        }
    }
}
