//
//  Question.swift
//  Personal Quiz
//
//  Created by Denis Bystruev on 14/03/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponceType
    var answers: [Answer]
    
    static func loadData() -> [Question] {
        return [
            Question(
                text: "Прежде чем отправиться в прошлое, нужно заправить машину времени. Литр бензина в настоящем перевалил за 46 Р. За сколько можно было купить девяносто пятый зимой 2009?",
                type: .single,
                answers: [
                    Answer(text: "10 рублей", points: 1),
                    Answer(text: "30 рублей", points: 2),
                    Answer(text: "15 рублей", points: 3),
                    Answer(text: "20 рублей", points: 4),
                ]
            ),
            Question(
                text: "Какие бренды входили в пятерку самых дорогих?",
                type: .multiple,
                answers: [
                    Answer(text: "Apple", points: -2),
                    Answer(text: "Microsoft", points: 2),
                    Answer(text: "Google", points: -2),
                    Answer(text: "Nokia", points: 2),
                ]
            ),
            Question(
                text: "После падения самый крупный пузырь всех времен стоит всего 3400 $. В 2009 году он уже существовал. За сколько тогда отдавали одну виртуальную монету?",
                type: .ranged,
                answers: [
                    Answer(text: "1000", points: 1),
                    Answer(text: "250", points: 2),
                    Answer(text: "100", points: 3),
                    Answer(text: "1", points: 4),
                ]
            ),
            Question(
                text: "В конце прошлого года с обменников сняли электронные табло, но курс узнать все еще можно. Сейчас он равен 75 Р. Сколько стоила европейская валюта после новогодних каникул 10 лет назад?",
                type: .single,
                answers: [
                    Answer(text: "30 рублей", points: 3),
                    Answer(text: "10 рублей", points: 1),
                    Answer(text: "40 рублей", points: 4),
                    Answer(text: "20 рублей", points: 2),
                    ]
            ),
            Question(
                text: "В конце 2018 года «Эпл» представил новые модели Айфона. Самая дорогая модель XS Max стоила 127 990 Р. В далеком 2009 вышел iPhone 3GS. Сколько тогда просили за новинку?",
                type: .ranged,
                answers: [
                    Answer(text: "20000", points: 1),
                    Answer(text: "25000", points: 2),
                    Answer(text: "40000", points: 3),
                    Answer(text: "35000", points: 4),
                    ]
            ),
        ]
    }
}

enum ResponceType {
    case single, multiple, ranged
}
