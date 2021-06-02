//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by 18992227 on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var answerTypeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answers: [Answer] = []
    
    private var mostFrequentAnswer: AnimalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        //print(answers) //Для удобства отслеживания данных в ответе
        countFrequentAnswer()
        answerTypeLabel.text = "Вы - \(mostFrequentAnswer.rawValue)"
        descriptionLabel.text = mostFrequentAnswer.definition
    }
}

extension ResultViewController {
    private func countFrequentAnswer() {
        var answersAnimalTypes = [AnimalType: Int]()
        
        for answer in answers {
            if answersAnimalTypes.keys.contains(answer.type) {
                for (type, value) in answersAnimalTypes {
                    if type == answer.type {
                        answersAnimalTypes.updateValue(value + 1, forKey: type)
                    }
                }
            } else {
                answersAnimalTypes[answer.type] = 1
            }
        }
        
        let maxValue = answersAnimalTypes.values.max() ?? 0
        var maxOrder = 0
        
        for animal in answersAnimalTypes {
            if maxValue == animal.value {
                if animal.key.order > maxOrder {
                    maxOrder = animal.key.order
                    mostFrequentAnswer = animal.key
                }
            }
        }
    }
}

