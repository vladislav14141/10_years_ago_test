//
//  QuestionViewController.swift
//  10 years ago test
//
//  Created by Миронов Влад on 17/03/2019.
//  Copyright © 2019 Миронов Влад. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - ... @IBOutlet
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var switchesButtons: [UISwitch]!
    @IBOutlet var multipleLabels: [UILabel]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedButton: UIButton!

    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var titleLabel: UILabel!
    
    
    // MARK: - ... Properties
    var questions = Question.loadData()
    var questionIndex = 0
    var result = 0
    
    // MARK: - ... UIViewController Methods
    override func viewDidLoad() {
        progressView.setProgress(0, animated: false)
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - ... Custom Methods
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        
        let currentQuestion = questions[questionIndex]
        titleLabel.text = currentQuestion.text
        
        switch currentQuestion.type {
        case .single:
            updateSingleTest()
        case .multiple:
            updateMultipleTest()
        case .ranged:
            updateRangeTest()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Result" {
            let dvc = segue.destination as! ResultViewController
            dvc.result = self.result
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        
        let progress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(progress, animated: true)
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Result", sender: nil)
        }

    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        let minCount = min(singleButtons.count, currentAnswers.count)
        
        for i in 0..<minCount {
            if singleButtons[i] == sender {
                let currentAnswer = currentAnswers[i]
               result += currentAnswer.points
                
                break
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func multButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        let minCount = min(switchesButtons.count, currentAnswers.count)
        
        for i in 0..<minCount {
            if switchesButtons[i].isOn {
                let currentAnswer = currentAnswers[i]
                result += currentAnswer.points
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangeButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        let currentAnswer = currentAnswers[index]
        result += currentAnswer.points
        
        nextQuestion()
    }
    
    func updateSingleTest(){
        var answers = questions[questionIndex].answers
        let minIndex = min(answers.count, singleButtons.count)
        
        for i in 0..<minIndex {
            singleButtons[i].setTitle(answers[i].text, for: .normal)
        }
        
        singleStackView.isHidden = false
    }
    
    func updateMultipleTest(){

        var answers = questions[questionIndex].answers
        let minIndex = min(answers.count, multipleLabels.count)
        
        for i in 0..<minIndex {
            switchesButtons[i].isOn = false
            multipleLabels[i].text = answers[i].text
        }
        
        multipleStackView.isHidden = false
    }
    
    
    func updateRangeTest() {
        
        var answers = questions[questionIndex].answers
        let minIndex = answers.count
        
        var minValue = Int(answers[0].text)!
        var maxValue = Int(answers[0].text)!
        
        for i in 0..<minIndex {
            let answer = Int(answers[i].text)!
            
            if minValue > answer { minValue = answer }
            if maxValue < answer { maxValue = answer }
        }
        
        rangedLabels.first?.text = "\(minValue)$"
        rangedLabels.last?.text = "\(maxValue)$"
        
        rangedStackView.isHidden = false
    }
}
