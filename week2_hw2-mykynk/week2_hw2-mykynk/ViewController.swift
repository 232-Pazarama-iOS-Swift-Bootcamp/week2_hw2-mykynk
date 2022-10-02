//
//  ViewController.swift
//  week2_hw2-mykynk
//
//  Created by Muhammed Yusuf Kaynak on 29.09.2022.
//

import UIKit

//getting an exponential function with '**'
precedencegroup Power {
    assignment: true
}
infix operator ** :  Power
extension Double {
    static func ** (num: Double, power: Double) -> Double{
        return pow(num, power)
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lastCalculate: UILabel!
    
    @IBOutlet weak var calculateText: UILabel!
    var calculateString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateText.text="0"
        lastCalculate.text="0"
    }
    
    func addStringtoCalculate(text:String){
        calculateString = calculateString + text
        calculateText.text = calculateString
        
    }
    
    func equals() {
        if(isValid()){
            
            
            var replaceScientificChar = calculateString.replacingOccurrences(of: "%", with: "*0.01")
            replaceScientificChar = replaceScientificChar.replacingOccurrences(of: "^", with: "**")
            replaceScientificChar = replaceScientificChar.replacingOccurrences(of: "π", with: "22/7")
            
            let expression = NSExpression(format: replaceScientificChar)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            
            lastCalculate.text = "\(calculateText.text!)  =  \(resultString)"
            calculateText.text = resultString
            calculateString = resultString
        }else{
            clearCurrent()
        }
        
        
        
        
    }
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    @IBAction func numberButtons(_ sender: UIButton) {
        print(sender.currentTitle ?? "")
    }
    func clearCurrent(){
        
        calculateText.text = "0"
        calculateString = ""
        
    }
    
    @IBAction func clearLast(_ sender: Any) {
        clearCurrent()
    }
    @IBAction func allClearButton(_ sender: Any) {
        calculateText.text = "0"
        calculateString = ""
        lastCalculate.text = ""
    }
    @IBAction func percentage(_ sender: Any) {
        clearCurrent()
        
        addStringtoCalculate(text: "%")
    }
    
    @IBAction func divideButton(_ sender: Any) {
        addStringtoCalculate(text: "/")
    }
    
    @IBAction func multipleButton(_ sender: Any) {
        addStringtoCalculate(text: "*")
    }
    
    @IBAction func minusButton(_ sender: Any) {
        addStringtoCalculate(text: "-")
    }
    
    @IBAction func piButton(_ sender: Any) {
        clearCurrent()
        
        addStringtoCalculate(text: "π")
        
    }
    @IBAction func sumButton(_ sender: Any) {
        addStringtoCalculate(text: "+")
    }
    
    @IBAction func equalsButton(_ sender: Any) {
        equals()
    }
    @IBAction func squareTap(_ sender: Any) {
        addStringtoCalculate(text: "^")
    }
    
    @IBAction func xSquareTap(_ sender: Any) {
        addStringtoCalculate(text: "^2")
    }
    
    @IBAction func tenXSquare(_ sender: Any) {
        clearCurrent()
        addStringtoCalculate(text: "10^")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addStringtoCalculate(text: "0")
        
    }
    @IBAction func oneTap(_ sender: Any) {
        addStringtoCalculate(text: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addStringtoCalculate(text: "2")
        
    }
    @IBAction func threeTap(_ sender: Any) {
        addStringtoCalculate(text: "3")
        
    }
    @IBAction func fourTap(_ sender: Any) {
        addStringtoCalculate(text: "4")
        
    }
    @IBAction func fiveTap(_ sender: Any) {
        addStringtoCalculate(text: "5")
        
    }
    @IBAction func sixTap(_ sender: Any) {
        addStringtoCalculate(text: "6")
        
    }
    @IBAction func sevenTap(_ sender: Any) {
        addStringtoCalculate(text: "7")
        
    }
    @IBAction func eightTap(_ sender: Any) {
        addStringtoCalculate(text: "8")
        
    }
    @IBAction func nineTap(_ sender: Any) {
        addStringtoCalculate(text: "9")
        
    }
    
    @IBAction func commaTap(_ sender: Any) {
        addStringtoCalculate(text: ".")
    }
    
    
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func isValid() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in calculateString
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == calculateString.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
}
