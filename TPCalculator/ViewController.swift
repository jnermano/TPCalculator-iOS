//
//  ViewController.swift
//  TPCalculator
//
//  Created by Innovlab Haiti on 4/14/18.
//  Copyright © 2018 Innovlab Haiti. All rights reserved.
//

import UIKit
import Darwin

enum Operation: String {
    case Plus = "+"
    case Sub = "-"
    case Divide = "/"
    case Multiply = "*"
    case BIN = "BIN"
    case HEX = "HEX"
    case NULL = "Null"
}

class ViewController: UIViewController {

    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var lastValue = ""
    var currentValue = ""
    var curOpe = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "0"
        
        
    }

    @IBAction func onNumberPressed(_ sender: UIButton) {
        
        if currentValue == "0" {
            currentValue = ""
        }
        
        if currentValue.count <= 8 {
            currentValue += "\(sender.tag)"
            outputLabel.text = "\(currentValue)"
        }
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        currentValue = ""
        lastValue = ""
        currentOperation = .NULL
        curOpe = ""
        outputLabel.text = "0"
        resultLabel.text = ""
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        
        if currentValue.count <= 7 && !currentValue.contains("."){
            currentValue += "."
            outputLabel.text = currentValue
        }
    }
    
    func calculate() {
        
        let expression = NSExpression(format: lastValue)
        
        let result =
            expression.expressionValue(with: nil, context: nil) as! NSNumber
        
        outputLabel.text = "\(result)"
        
        resultLabel.text = lastValue
        lastValue = ""
        currentValue = "\(result)"
        
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        if currentValue.count > 0 && curOpe != ""{
            if curOpe != "" {
                lastValue += curOpe
            }
            curOpe = ""
            lastValue += currentValue
            
        }
        
            calculate()
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        if currentValue.count > 0 {
            
            
            if curOpe != "" {
                lastValue += curOpe
            }
            lastValue += currentValue
            curOpe = " / "
            
            currentOperation = .Divide
            currentValue = ""
            resultLabel.text = lastValue
            outputLabel.text = "0"
        }
    }
    
    @IBAction func multiPressed(_ sender: UIButton) {
        if currentValue.count > 0 {
            
            if curOpe != "" {
                lastValue += curOpe
            }
            lastValue += currentValue
            curOpe = " * "
            
            currentOperation = .Multiply
            currentValue = ""
            resultLabel.text = lastValue
            outputLabel.text = "0"
        }    }
    
    @IBAction func subPressed(_ sender: UIButton) {
        if currentValue.count > 0 {
            
            if curOpe != "" {
                lastValue += curOpe
            }
            lastValue += currentValue
            curOpe = " - "
            
            currentOperation = .Sub
            currentValue = ""
            resultLabel.text = lastValue
            outputLabel.text = "0"
        }    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        if currentValue.count > 0 {
            
            if curOpe != "" {
                lastValue += curOpe
            }
            lastValue += currentValue
            curOpe = " + "
            
            currentOperation = .Plus
            currentValue = ""
            resultLabel.text = lastValue
            outputLabel.text = "0"
        }
        
    }
    
    @IBAction func binPressed(_ sender: UIButton) {
        
        outputLabel.text = String(Int(currentValue)!, radix:2)
        resultLabel.text = "bin(\(currentValue))"
        
        currentValue = ""
        lastValue = ""
        currentOperation = .NULL
        curOpe = ""
    }
    
    @IBAction func hexPressed(_ sender: UIButton) {
        
        
        outputLabel.text = String(Int(currentValue)!, radix:16)
        resultLabel.text = "hex(\(currentValue))"
        
        currentValue = ""
        lastValue = ""
        currentOperation = .NULL
        curOpe = ""
        
        
        
    }
   
    
}

