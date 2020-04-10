//
//  ViewController.swift
//  basic-calculator
//
//  Created by Athanasios Canko on 10.4.20.
//  Copyright © 2020 Athanasios Canko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNumberInput: UITextField!
    @IBOutlet weak var secondNumberInput: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func additionButton(_ sender: Any) {
        startProcess(char: "+")
    }
    
    @IBAction func subtractionButton(_ sender: Any) {
        startProcess(char: "-")
    }
    
    @IBAction func multiplicationButton(_ sender: Any) {
        startProcess(char: "*")
    }
    
    @IBAction func divisionButton(_ sender: Any) {
        startProcess(char: "/")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startProcess(char: String) {
        let validated = validateInput()
        
        if validated {
            performOperation(char: char)
        }
        else {
            resultLabel.text = "Result: Please type numbers in both fields."
        }
    }
    
    func validateInput() -> Bool {
        if Int(firstNumberInput.text!) != nil {
            if Int(secondNumberInput.text!) != nil {
                return true
            }
        }
        return false
    }
    
    func performOperation(char: String) {
        let firstNumber = Int(firstNumberInput.text!)!
        let secondNumber = Int(secondNumberInput.text!)!
        
        if char == "+" {
            resultLabel.text = "Result: \(firstNumber + secondNumber)"
        }
        else if char == "-" {
            resultLabel.text = "Result: \(firstNumber - secondNumber)"
        }
        else if char == "*" {
            resultLabel.text = "Result: \(firstNumber * secondNumber)"
        }
        else if char == "/" {
            if secondNumber != 0 {
                resultLabel.text = "Result: \(firstNumber / secondNumber)"
            }
            else {
                resultLabel.text = "Result: Cannot divide by zero."
            }
        }
        else {
            resultLabel.text = "Result: Unknown error occured."
            print("performOperation error")
        }
    }
}

