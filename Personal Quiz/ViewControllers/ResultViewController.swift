//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by 18992227 on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    // 1. Массив ответов
    // 2. Определить наиболее часто встречаемый тип животного
    // 3. Отобразить результат
    // 4. Избавиться от кнопки Back
    
    @IBOutlet weak var answerTypeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var answers: [Answer] = []
    
    private var mostFrequentAnswer: AnimalType = AnimalType.cat
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        print(answers)
        countAnimalTypes()
        answerTypeLabel.text = "Вы - \(mostFrequentAnswer.rawValue)"
        descriptionLabel.text = mostFrequentAnswer.definition
    }
    
}


extension ResultViewController {
    private func countAnimalTypes() {
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
        
        for answer in answersAnimalTypes {
            if maxValue == answer.value {
                mostFrequentAnswer = answer.key
            }
        }
        
    }
    
    
}

