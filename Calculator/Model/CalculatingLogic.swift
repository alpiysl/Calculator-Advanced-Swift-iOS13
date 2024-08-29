//
//  CalculatingLogic.swift
//  Calculator
//
//  Created by Alpaslan Uysal on 29.08.2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculatingLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (calcMethod: String, n1:Double)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalc(n2: n)
            default:
                intermediateCalculation = (calcMethod: symbol, n1: n)
            }
        }
        
        
        return nil //we did return type optional Double so we can return nil
    }
    
    private func performTwoNumCalc(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1+n2
            case "-":
                return n1-n2
            case "÷":
                return n1/n2
            case "×":
                return n1*n2
            default :
                fatalError("no match")
            }
        }
        return nil
    }
}


