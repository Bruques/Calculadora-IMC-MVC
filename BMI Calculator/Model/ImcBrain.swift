//
//  ImcBrain.swift
//  BMI Calculator
//
//  Created by Bruno Nascimento Marques on 03/02/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct ImcBrain {
    
    var imc: Double = 0
    var height: Double = 0
    var weight: Double = 0
    
    var result: Dictionary = [
        "0" : "Magreza grave!",
        "1" : "Abaixo do peso ideal!",
        "2" : "Seu peso está ideal!",
        "3" : "Você está acima do peso!",
        "4" : "Obesidade!"
    ]
    
    mutating func getHeightValue(heightValue: Double) {
        height = heightValue
    }
    
    mutating func getWeightValue(weightValue: Double) {
        weight = weightValue
    }
    
    mutating func calculateImc() {
        imc = weight / (height * height)
    }
    
    func getResult() -> String {
        
        switch imc {
        case 0..<16:
            return result["0"] ?? ""
        case 16..<18.5:
            return result["1"] ?? ""
        case 18.5..<25:
            return result["2"] ?? ""
        case 25..<30:
            return result["3"] ?? ""
        default:
            return result["4"] ?? ""
        }
    }
    
    func getColor() -> UIColor {
        
        switch imc {
        case 0..<16:
            return .red
        case 16..<18.5:
            return .darkGray
        case 18.5..<25:
            return .init(red: 0, green: 0.5098, blue: 0.0314, alpha: 1)
        case 25..<30:
            return .brown
        default:
            return .black
        }
    }
}
