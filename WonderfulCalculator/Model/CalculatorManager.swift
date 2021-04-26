//
//  CalculatorManager.swift
//  WonderfulCalculator
//
//  Created by Roman Nabiullin on 26.04.2021.
//

import Foundation

struct CalculatorManager {
    
    private var currentArgument: Double?
    private var reservedArgument: Double?
    private var reservedOperation: String?
    
    mutating func setNumber(_ number: Double) {
        currentArgument = number
    }
    
    mutating func perform(_ operation: String) -> Double? {
        
        guard let argument = currentArgument else { return nil }
        
        switch operation {
        case "+/-":
            return -1 * argument
        case "AC":
            return 0
        case "%":
            return 0.01 * argument
        case "=":
            return evaluate(secondArg: argument)
        default:
            reservedArgument = argument
            reservedOperation = operation
            return nil
        }
        
    }
    
    private func evaluate(secondArg: Double) -> Double? {
        
        guard
            let firstArgument = reservedArgument,
            let operation = reservedOperation
        else { return nil }
        
        switch operation {
        case "+":
            return firstArgument + secondArg
        case "-":
            return firstArgument - secondArg
        case "x":
            return firstArgument * secondArg
        case "/":
            return firstArgument / secondArg
        default:
            fatalError("Invalid operation \(operation) has been passed!")
        }
        
    }
    
}
