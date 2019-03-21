//
//  ResultViewController.swift
//  10 years ago test
//
//  Created by Миронов Влад on 17/03/2019.
//  Copyright © 2019 Миронов Влад. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var questions = Question.loadData()
    var result: Int!
    @IBOutlet var resultAnswerLable: UILabel!
    @IBOutlet var resultDefinitionLable: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        countResult()
    }
    
    func countResult() {
        let maxResult = questions.count * 4
        
        switch Double(result) {
        case  ..<(Double(maxResult) * 0.25):
            updateUI(with: .kid)
        case  ..<(Double(maxResult) * 0.5):
            updateUI(with: .boy)
        case  ..<(Double(maxResult) * 0.75):
            updateUI(with: .men)
        default:
            updateUI(with: .grand)
        }
    }
    
    func updateUI(with person: PersonType) {
        resultAnswerLable.text = "Вы — \(person.rawValue)"
        resultDefinitionLable.text = person.definition
    }
}
