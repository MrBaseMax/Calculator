//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Макс on 15.08.2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation


struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(_ method: String) -> Double? {
        guard let number = number else { return nil }
        
        switch method {
        case "AC":
            return 0
        case "C":
            return 0
        case "+/-":
            return -number
        case "%":
            return number / 100
        case "=":
            return performTwoNumCalculation(n2:number)
        default:
            intermediateCalculation = (n1: number, calcMethod: method)
        }
        
        return nil
    }
	
    mutating private func performTwoNumCalculation(n2: Double) -> Double? {
        guard let interm = intermediateCalculation else { return nil }
        
        switch interm.calcMethod {
        case "+":
            return interm.n1 + n2
        case "-":
            return interm.n1 - n2
        case "×":
            return interm.n1 * n2
        case "÷":
            return interm.n1 / n2

        default:
            fatalError("Unexpected calculation method")
        }
    }
	
	
}

