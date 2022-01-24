//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
    //MARK: - attrs
	@IBOutlet weak var displayLabel: UILabel!
	
	private var calculator = CalculatorLogic()
	private var isFinishedTypingNumber: Bool = true
	
	private var displayValue: Double {
		get {
			guard let number = Double( displayLabel.text! ) else {
				fatalError( "Cannot convert display label text into Double" )
			}
			return number
		}
		set {
			displayLabel.text = String( newValue )
		}
	}
	
	//MARK: - methods
	@IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle,
           let result = calculator.calculate( calcMethod ) {
            displayValue = result
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        guard let numValue = sender.currentTitle else { return }
        
        if isFinishedTypingNumber {
            displayLabel.text = numValue
            isFinishedTypingNumber = false
            
        } else {
            if numValue == ".", displayLabel.text!.contains(".") {
                return
            }
            displayLabel.text = displayLabel.text! + numValue
        }
    }
}

