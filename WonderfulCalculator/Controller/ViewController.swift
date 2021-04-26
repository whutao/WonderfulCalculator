//
//  ViewController.swift
//  WonderfulCalculator
//
//  Created by Roman Nabiullin on 25.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Variables
    
    private var calculator = CalculatorManager()
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Display value is not a number!")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - IBActions
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        guard let value = sender.currentTitle else { return }
        
        if isFinishedTypingNumber {
            displayLabel.text = value
            isFinishedTypingNumber = false
        } else {
            
            if value == "," {
                let isInteger = floor(displayValue) == displayValue
                if !isInteger { return }
            }
            
            if String(displayValue).count < 10 {
                displayLabel.text = displayLabel.text! + String(value)
            }
            
        }
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        guard let operation = sender.currentTitle else { return }
        
        if let result = calculator.perform(operation) {
            displayValue = result
        }
    }
    
    
}

